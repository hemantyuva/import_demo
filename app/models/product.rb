class Product < ActiveRecord::Base

	def self.import(file)
		options = {:chunk_size => 2} 
	  SmarterCSV.process(file.path, options) do |chunk|
	  	chunk.each do |item|
	  		desc = item[:item_description]
	  		status = item[:item_status]
	  		category = item[:category]
	  		salas = item[:sales_type]
	  		Product.create(description: desc, item_status: status, category: category, salary_type: salas)
	  	end
		end
	end
end
