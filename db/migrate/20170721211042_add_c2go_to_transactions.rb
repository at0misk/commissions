class AddC2goToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :c2go, :string
  end
end
