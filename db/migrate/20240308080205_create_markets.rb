class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.references :user,             null: false, foreign_key: true
      t.string     :goods,            null: false
      t.text       :explan,           null: false
      t.integer    :condition_id,     null: false
      t.integer    :category_id,      null: false
      t.integer    :shipping_fee_id,  null: false
      t.integer    :shipping_day_id,  null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :price,            null: false
      
      t.timestamps
    end
  end
end
