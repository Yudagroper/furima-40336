class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.references :market, null: false, foreign_key: true
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
