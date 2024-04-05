class AddOptionOnDeleteCascadeToTestPassages < ActiveRecord::Migration[6.1]
  def up
    remove_foreign_key :test_passages, :tests
    add_foreign_key :test_passages, :tests, on_delete: :cascade
  end

  def down
    remove_foreign_key :test_passages, :tests
    add_foreign_key :test_passages, :tests
  end
end
