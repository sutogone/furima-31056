class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/}

  regex_all = /\A[ぁ-んァ-ン一-龥]/
  regex_kana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: regex_all }
    validates :first_name, format: { with: regex_all }
    validates :last_name_kana, format: { with: regex_kana }
    validates :first_name_kana, format: { with: regex_kana }
    validates :birthday
  end

  has_many :items
  has_many :purchases
end