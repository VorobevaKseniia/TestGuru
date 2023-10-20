class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, default: false
      t.references :questions, foreign_key: true, null: false

      t.timestamps
    end
  end
end
