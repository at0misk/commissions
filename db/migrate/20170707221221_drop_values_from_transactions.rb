class DropValuesFromTransactions < ActiveRecord::Migration[5.0]
  def change
  	remove_column :transactions, :agent_total
  	remove_column :transactions, :upline_total
  	remove_column :transactions, :evo_total
  end
end
