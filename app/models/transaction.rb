class Transaction < ApplicationRecord
  has_one :agent, :class_name => "User"
  has_one :upline, :class_name => "User"
  	def self.import(file)
	  spreadsheet = Roo::Spreadsheet.open(file.path)
	  header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			transaction = find_by(invoice: row["invoice"]) || new
			user = User.find_by(evo_id: row['evo_id'])
			if user
				transaction.agent_id = row['evo_id']
				transaction.upline_id = user.upline_id
				transaction.agent_total = (row['commission_total']*0.8).round(2)
				transaction.upline_total = (row['commission_total']*0.1).round(2)
				transaction.evo_total = (row['commission_total']*0.1).round(2)
				transaction.commission_total = row['commission_total']
				transaction.invoice = row['invoice']
				transaction.save!
			end
		end
	end
end
