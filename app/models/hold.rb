class Hold < ApplicationRecord
  	def self.import(file)
	  spreadsheet = Roo::Spreadsheet.open(file.path)
	  header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			hold = find_by(key: row["key"]) || new
			user = User.find_by(evo_id: row['evo_id'])
			if user
				hold.key = row['key']
				hold.evo_id = row['evo_id']
				hold.acct = row['acct']
				hold.invoice = row['invoice']
				hold.issue_date = row['issue_date']
				hold.rev = row['rev']
				hold.traveler = row['traveler']
				hold.dep_date = row['dep_date']
				hold.ret_date = row['ret_date']
				hold.fare_total = row['fare_total']
				hold.comm_total = row['comm_total']
				hold.air = row['air']
				hold.eight_nine = row['eight_nine']
				hold.upline = row['upline']
				hold.paid_agent = row['paid_agent']
				hold.method = row['method']
				hold.ticket = row['ticket']
				hold.itinerary = row['itinerary']
				hold.name = row['name']
				hold.c2go = row['c2go']
				hold.email = row['email']
				hold.save!
			end
		end
	end
end
