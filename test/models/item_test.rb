require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "id count" do
    Item.transaction do
      3.times do
        Item.create!
      end
      raise ActiveRecord::Rollback
    end
    Item.create!
    assert_equal 1, Item.count
    assert_equal Item.count, Item.last.id
  end
end
