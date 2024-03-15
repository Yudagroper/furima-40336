class Receipt < ApplicationRecord
  belongs_to :user
  belongs_to :market
  has_one :buy
end
