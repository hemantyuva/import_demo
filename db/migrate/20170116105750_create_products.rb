class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description
      t.string :item_status
      t.string :category
      t.string :salary_type

      t.timestamps null: false
    end
  end
end
