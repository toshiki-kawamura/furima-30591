class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :comments
  has_many :items
  has_many :purchases

  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i }
    validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :last_name_kana,  format: { with: KANA_REGEX }
    validates :first_name_kana, format: { with: KANA_REGEX }
    validates :date_of_birth
  end
end
