class AddTravelerToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :traveler, :string
  	add_column :transactions, :itinerary, :string
  end
end
