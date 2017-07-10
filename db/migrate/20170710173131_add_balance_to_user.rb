class AddBalanceToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :balance, :decimal, :precision => 8, :scale => 4
  end
end
