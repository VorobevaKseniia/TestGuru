class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, default: true
      t.integer :question_id, null: false
      t.references :questions, foreign_keys: true

      t.timestamps
    end
  end
end
