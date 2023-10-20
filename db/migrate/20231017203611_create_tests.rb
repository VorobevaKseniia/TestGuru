class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.references :categories,  foreign_key: true, default: 0

      t.timestamps
    end
  end
end
