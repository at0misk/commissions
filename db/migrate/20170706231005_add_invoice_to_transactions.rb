class AddInvoiceToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :invoice, :integer
  end
end
