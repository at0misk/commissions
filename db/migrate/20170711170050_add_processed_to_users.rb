class AddProcessedToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :processed, :boolean
  end
end
