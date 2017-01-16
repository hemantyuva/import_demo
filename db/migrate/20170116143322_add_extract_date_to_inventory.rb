class AddExtractDateToInventory < ActiveRecord::Migration
  def change
    add_column :inventories, :extract_date, :datetime
  end
end
