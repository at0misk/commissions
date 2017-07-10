class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :agent, foreign_key: true
      t.references :upline, foreign_key: true

      t.timestamps
    end
  end
end
