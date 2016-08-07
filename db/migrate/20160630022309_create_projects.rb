class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :github
      t.boolean :show_finished, default: false
      
      t.timestamps null: false
    end
  end
end
