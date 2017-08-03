class AddTotalToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :agent_total, :decimal, :precision => 8, :scale => 2
  	add_column :users, :upline_total, :decimal, :precision => 8, :scale => 2
  	add_column :users, :evo_total, :decimal, :precision => 8, :scale => 2
  end
end
