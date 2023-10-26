class AddColumnToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :author, null: false
  end
end
