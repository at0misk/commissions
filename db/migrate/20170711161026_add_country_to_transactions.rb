class AddCountryToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :country, :string
  end
end
