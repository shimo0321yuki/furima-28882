class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        with_options presence: true do
         validates :nickname
         validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
         validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i}
         validates :password_confirmation, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}\z/i}
         validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :first_name_kana, format: {with: /\A[ァ-ヴ]+\z/}
         validates :family_name_kana, format: {with: /\A[ァ-ヴ]+\z/}
         validates :birthday
        #  validates :birthday, date_not_before_today
        #  validate :birthday_cannot_be_in_the_future
  
        #   # 生年月日の未来日のチェックメソッド
        #   def birthday_cannot_be_in_the_future
        #     # 生年月日が入力済かつ未来日(現在日付より未来)
        #     if birthday.present? && birthday > Date.today
        #      # エラー対象とするプロパティ(birthday)とエラーメッセージを設定
        #     errors.add(:birthday, "can not specify your future date as your birth date.")
        #     end
        #   end
        end
end