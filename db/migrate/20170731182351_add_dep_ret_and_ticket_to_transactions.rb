class AddDepRetAndTicketToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :depart_date, :string
  	add_column :transactions, :return_date, :string
  	add_column :transactions, :ticket_num, :string
  end
end
