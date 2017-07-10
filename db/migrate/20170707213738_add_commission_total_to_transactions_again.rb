class AddCommissionTotalToTransactionsAgain < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :commission_total, :decimal, :precision => 19, :scale => 4
  end
end
