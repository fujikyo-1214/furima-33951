class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates :password, format: { with: PASSWORD_REGEX, message: "Password Include both letters and numbers" }
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/ } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :kana_first_name
      validates :kana_last_name
    end
  end
end
