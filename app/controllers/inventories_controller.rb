class InventoriesController < ApplicationController
  def index
  end

  def on_hand_inventory
  	@inventories = Inventory.where(inventory_type: "on_hand_import")
  end

  def in_transit_inventory
  	@inventories = Inventory.where(inventory_type: "in_transit_import")
  end

  def on_hand_import
  	Inventory.import(params[:file],params[:action],params[:extract_date])
  	redirect_to on_hand_inventory_inventories_path, notice: "Products imported."	
  end

  def in_transit_import
  	Inventory.import(params[:file],params[:action],params[:extract_date])
  	redirect_to in_transit_inventory_inventories_path, notice: "Products imported."
  end
end
