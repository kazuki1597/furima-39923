class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :purchase_informations
  validates :name, presence: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  kanji_name = /\A[ぁ-んァ-ン一-龥々]+\z/
  # 1字以上の全角のみ
  validates_format_of :first_name,:last_name, with: kanji_name, message: '設定してください'
  kana_name = /\A[ァ-ヶー－]+\z/
  validates_format_of :first_name_kana,:last_name_kana, with: kana_name, message: '設定してください'
end



