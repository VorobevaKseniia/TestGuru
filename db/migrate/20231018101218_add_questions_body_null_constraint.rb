class AddQuestionsBodyNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:questions, :body, false)
    add_foreign_key :questions, :tests, column: :test_id
  end
end
