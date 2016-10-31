class CreateTasksProducts < ActiveRecord::Migration
  def change
    create_table :tasks_products do |t|
      t.belongs_to :task, index: true
      t.belongs_to :product, index: true
      t.string :file_name
      t.integer :quantity

      t.timestamps
    end
  end
end
