class AddFieldsAgain < ActiveRecord::Migration[5.0]
  def change
  	add_column :transactions, :agent_total, :decimal, :precision => 8, :scale => 4
  	add_column :transactions, :upline_total, :decimal, :precision => 8, :scale => 4
  	add_column :transactions, :evo_total, :decimal, :precision => 8, :scale => 4
  end
end
