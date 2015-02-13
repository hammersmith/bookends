require 'test_helper'

class IdentifierTest < ModelTestCase
  test 'should belong to Work' do
    work = create :work, id: 1
    identifier = create :identifier, work_id: 1

    assert_equal work, identifier.work
  end
end
