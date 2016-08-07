class AddShowFinishedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :show_finished, :boolean, default: false
  end
end
