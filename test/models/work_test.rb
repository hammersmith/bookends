require 'test_helper'

class WorkTest < UnitTestCase

  test 'should have identifiers return instances of Identifier' do
    work = build :work, id: 1
    create :identifier, work_id: 1

    assert_instance_of Identifier, work.identifiers.first
  end

  test 'should validate presence of title and author' do
    work = Work.new
    assert_not_predicate work, :valid?
    assert_equal ["can't be blank"], work.errors.messages[:title]
    assert_equal ["can't be blank"], work.errors.messages[:author]
  end

  test 'should validate media_format' do
    work_blank = Work.new
    assert_not_predicate work_blank, :valid?
    assert_equal ["can't be blank", ' is not a valid format'], work_blank.errors.messages[:media_format]

    work_invalid = Work.new(media_format: 'wrong')
    assert_not_predicate work_invalid, :valid?
    assert_equal ['wrong is not a valid format'], work_invalid.errors.messages[:media_format]
  end

  test 'should validate that the location is set' do
    work = build :work, location: nil
    assert_not_predicate work, :valid?
    assert_equal ["can't be blank"], work.errors.messages[:location]
    work.location = create :location
    assert_predicate work, :valid?
  end

  test 'should have valid date if provided' do
    work = build :work
    assert_predicate work, :valid?
    work.published_on = 'foobar'
    assert_not_predicate work, :valid?
    assert_equal ['must be a date'], work.errors[:published_on]
  end

  test 'should return available works' do
    unavailable_work = create :work, title: 'unavailable'
    available_work = create :work, title: 'available'
    create :book, work_id: available_work.id, status: :available
    create :book, work_id: unavailable_work.id, status: :reserved

    assert_equal [available_work],  Work.available
  end

  test 'should call SOLR index! after touch' do
    work = create :work
    work.expects(:index!)
    work.touch
  end

  test 'should be available? if it has available books' do
    work = create :work
    assert_not_predicate work, :available?
    create :book, work: work, status: :reserved
    assert_not_predicate work, :available?
    create :book, work: work, status: :available
    assert_predicate work, :available?
  end

  test 'should return identifying codes' do
    work = create :work
    create :identifier, work: work, code: 'isbn'
    create :identifier, work: work, code: 'loc'
    assert_equal %w(isbn loc), work.identifying_codes
  end

end
