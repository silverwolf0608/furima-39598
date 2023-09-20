class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :birthday, presence: { message: "date can't be blank"}

  PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[A-Za-z0-9]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters'} do
    validates :last_name
    validates :frist_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters'} do
    validates :kana_last_name
    validates :kana_first_name
  end
  
end
