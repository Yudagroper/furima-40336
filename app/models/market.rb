class Market < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user


  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_day

  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :image
    validates :goods
    validates :explan 
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_day_id
  end
end
