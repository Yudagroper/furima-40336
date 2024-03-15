class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.string     :postcode,                 null: false
      t.integer    :prefecture_id,            null: false
      t.string     :municipalities,           null: false
      t.string     :street_address,           null: false
      t.string     :building
      t.string     :telephone_number,         null: false
      t.references :receipt,                  null: false, foreign_key: true

      t.timestamps
    end
  end
end
