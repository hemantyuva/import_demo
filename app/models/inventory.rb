class Inventory < ActiveRecord::Base

	def self.import(file,action,date)
		options = {:chunk_size => 2}
		right_date = date.split("/")[1]+"/"+date.split("/")[0]+"/"+date.split("/")[2]
	  SmarterCSV.process(file.path, options) do |chunk|
	  	chunk.each do |item|
	  		if item.present?
		  		org = item[:org_number]
		  		quantity = item[:quantity]
		  		status = item[:status]
		  		lot = item[:lot]
		  		if item[:due_date].present?
		  			ship_date = item[:due_date].split("-")[1]+"-"+item[:due_date].split("-")[0]+"-"+item[:due_date].split("-")[2]
		  		else
		  			ship_date = item[:last_ship_date].split("-")[1]+"-"+item[:last_ship_date].split("-")[0]+"-"+item[:last_ship_date].split("-")[2]
		  		end 
		  		exact_date = ship_date.to_date
		  		Inventory.create(org_number: org, quantity: quantity, status: status, lot: lot, ship_date: ship_date,inventory_type: action,extract_date: right_date)
		  	end
	  	end
		end
	end

end
