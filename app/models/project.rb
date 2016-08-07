class Project < ActiveRecord::Base
  has_many :todo_lists

  def change_show_status
    self.show_finished = (self.show_finished == false) ? true : false
  end

  def ordered_todo_lists
    if(self.show_finished)
      self.todo_lists.order(finished: :asc)
    else
      self.todo_lists.order(finished: :asc).where(finished: self.show_finished)
    end
  end
end
