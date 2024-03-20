class ReceiptForm
  include ActiveModel::Model
  attr_accessor :user_id, :market_id, :postcode, :prefecture_id, :municipalities, :street_address, :building, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :market_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    receipt = Receipt.create(user_id: user_id, market_id: market_id)
    Buy.create(receipt_id: receipt, postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building: building, telephone_number: telephone_number)
  end
end