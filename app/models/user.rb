class User < ApplicationRecord
	has_many :transactions
	def self.import(file)
	  spreadsheet = Roo::Spreadsheet.open(file.path)
	  header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			user = find_by(evo_id: row["evo_id"]) || new
			puts i[0]
			puts "=================="
			puts row['ID']
			puts "=================="
			# fail
			user.evo_id = row['ID']
			user.upline_id = row['SponsorID']
			user.first = row['FirstName']
			user.last = row['LastName']
			puts user.last.upcase
			user.save!
		end
	end
end
