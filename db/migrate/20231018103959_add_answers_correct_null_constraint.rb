class AddAnswersCorrectNullConstraint < ActiveRecord::Migration[6.1]
  def change
    #change_column_null(:answers, :correct, false)
    change_column :answers, :correct, :boolean
    change_column_default :answers, :correct, to: true
    add_foreign_key :answers, :questions, column: :question_id
  end
end
