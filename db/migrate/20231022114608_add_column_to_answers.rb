class AddColumnToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :body, :text, null: false
  end
end
