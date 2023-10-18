class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tests, :title, false
    change_column_default :tests, :level, from: '', to: 0
  end

  # def up
  #   change_column_null(:tests, :title, false)
  # end

  # def down
  #   change_column_null(:tests, :title, true)
  # end
end
