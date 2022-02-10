require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "id count" do
    Item.create!(name: 'foo')
    ApplicationRecord.connection.exec_query(<<~SQL)
      INSERT OR IGNORE INTO items
      (name, created_at, updated_at)
      VALUES
      ('foo', 0,0)
    SQL
    Item.create!(name: 'bar')
    assert_equal 2, Item.count
    assert_equal Item.count, Item.last.id
  end
end
