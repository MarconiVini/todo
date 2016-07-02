class Project < ActiveRecord::Base
  has_many :todo_lists

  def ordered_todo_lists
    self.todo_lists.order(finished: :asc)
  end
end
