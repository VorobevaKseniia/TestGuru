class AddColumnCompletedToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :completed, :boolean, default: false
  end
end
