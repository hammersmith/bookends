require 'test_helper'

class WorkTest < ModelTestCase

  test 'identifiers returns an Identifier' do
    work = build :work, id: 1
    create :identifier, work_id: 1

    assert_equal Identifier, work.identifiers.first.class
  end

  test 'validates presence of title and author' do
    work = Work.new
    assert_not_predicate work, :valid?
    assert_equal ["can't be blank"], work.errors.messages[:title]
    assert_equal ["can't be blank"], work.errors.messages[:author]
  end

  test 'validates media_format' do
    work_blank = Work.new
    assert_not_predicate work_blank, :valid?
    assert_equal ["can't be blank", ' is not a valid format'], work_blank.errors.messages[:media_format]

    work_invalid = Work.new(media_format: 'wrong')
    assert_not_predicate work_invalid, :valid?
    assert_equal ['wrong is not a valid format'], work_invalid.errors.messages[:media_format]
  end

  test 'must have location set' do
    work = build :work, location: nil
    assert_not_predicate work, :valid?
    assert_equal ["can't be blank"], work.errors.messages[:location]
    work.location = create :location
    assert_predicate work, :valid?
  end

end
