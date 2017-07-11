class AddIssueDateToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :issue_date, :date
  end
end
