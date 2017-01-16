class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :org_number
      t.integer :quantity
      t.string :status
      t.integer :lot
      t.datetime :ship_date

      t.timestamps null: false
    end
  end
end
