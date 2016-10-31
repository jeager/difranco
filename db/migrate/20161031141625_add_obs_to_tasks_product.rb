class AddObsToTasksProduct < ActiveRecord::Migration
  def change
    add_column :tasks_products, :obs, :string
  end
end
