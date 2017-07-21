class AddAgentNameToTransactions < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :agent_name, :string
  end
end
