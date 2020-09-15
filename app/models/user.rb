class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  with_options presence: true do
    validates :nickname
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヴ]+\z/ }
    validates :family_name_kana, format: { with: /\A[ァ-ヴ]+\z/ }
    validates :birthday
  end
  
  has_many :items
  has_many :purchaser
  
end
