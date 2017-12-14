class AddActiveToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :active, :boolean
  end
end
