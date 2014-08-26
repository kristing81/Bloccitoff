class AddTodoToList < ActiveRecord::Migration
  def change
    add_column :lists, :todo_id, :integer
    add_index :lists, :todo_id
  end
end
