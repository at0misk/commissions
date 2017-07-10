class Product < ApplicationRecord
	def self.import(file)
	  spreadsheet = Roo::Spreadsheet.open(file.path)
	  header = spreadsheet.row(2)
		(3..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			product = find_by(name: row["name"]) || new
			product.attributes = row.to_hash
			product.save!
		end
	end
end