class User < ApplicationRecord
	has_many :transactions
	def self.import(file)
	  spreadsheet = Roo::Spreadsheet.open(file.path)
	  header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			user = find_by(evo_id: row["ID"]) || new
			user.evo_id = row['ID']
			user.upline_id = row['SponsorID']
			user.first = row['FirstName']
			user.last = row['LastName']
			user.c2go = row['C2GOID']
			user.web_name = row['WebRepName']
			user.address = row['Address']
			user.apt = row['Apt']
			user.city = row['City']
			user.state = row['State']
			user.zip = row['Zip']
			user.country = row['Country']
			user.phone = row['Cellular']
			user.email = row['email']
			if user.processed == true
			else
				user.processed = false
			end
			user.save!
		end
	end
end
