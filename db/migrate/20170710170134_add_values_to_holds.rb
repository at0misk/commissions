class AddValuesToHolds < ActiveRecord::Migration[5.0]
  def change
  	add_column :holds, :fare_total, :decimal, :precision => 8, :scale => 4
  	add_column :holds, :comm_total, :decimal, :precision => 8, :scale => 4
  	add_column :holds, :air, :decimal, :precision => 8, :scale => 4
  	add_column :holds, :eight_nine, :decimal, :precision => 8, :scale => 4
  	add_column :holds, :upline, :decimal, :precision => 8, :scale => 4
  	add_column :holds, :paid_agent, :decimal, :precision => 8, :scale => 4
  end
end
