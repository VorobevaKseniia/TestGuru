class AddColumnSucceedeToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :succeeded, :boolean, null: false, default: false
  end
end
