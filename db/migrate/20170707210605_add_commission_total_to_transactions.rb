class AddCommissionTotalToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :commission_total, :integer
  end
end
