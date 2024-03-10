class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :markets
  validates :handle_name, uniqueness: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :furigana_last, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :furigana_first, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
  
end
