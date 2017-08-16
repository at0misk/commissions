class AddRevTypeToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :revenue_type, :string
  end
end
