require 'test_helper'

class WorkTest < ModelTestCase

  test 'identifiers returns an Identifier' do
    work = create :work, id: 1
    create :identifier, work_id: 1

    assert_equal Identifier, work.identifiers.first.class
  end

end
