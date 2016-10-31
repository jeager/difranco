class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.float :cost_value
      t.float :sale_value
      t.string :name
      t.integer :quantity_in_stock

      t.timestamps
    end
  end
end
