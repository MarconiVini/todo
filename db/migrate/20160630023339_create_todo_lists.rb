class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :todo
      t.boolean :finished
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
