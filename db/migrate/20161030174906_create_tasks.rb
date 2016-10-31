class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :client_name
      t.float :value
      t.float :discount
      t.float :final_value
      t.string :status

      t.timestamps
    end
  end
end
