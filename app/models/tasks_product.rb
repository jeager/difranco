class TasksProduct < ActiveRecord::Base
  belongs_to :task
  belongs_to :product
end
