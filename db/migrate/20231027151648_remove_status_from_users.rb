class RemoveStatusFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :status, :string
    add_column :users, :email, :string, null: false
  end
end
