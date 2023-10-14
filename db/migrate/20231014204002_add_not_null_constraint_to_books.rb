class AddNotNullConstraintToBooks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :author, false
    change_column_null :books, :description, false
  end
end
