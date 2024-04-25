class AddOptionOnDeleteSetDefaultToQuestions < ActiveRecord::Migration[6.1]
  def up
    change_column_null :questions, :test_id, true
    remove_foreign_key :questions, :tests
    add_foreign_key :questions, :tests, on_delete: :nullify
  end

  def down
    change_column_null :questions, :test_id, false
    remove_foreign_key :questions, :tests
    add_foreign_key :questions, :tests
  end
end
