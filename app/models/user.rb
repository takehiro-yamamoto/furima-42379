class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true

  # パスワードは英数字混合であること（6文字以上はDeviseがチェック）
  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は英数字を両方含む必要があります' }, on: :create

  # 名前は全角（漢字・ひらがな・カタカナ）
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  validates :last_name, format: { with: VALID_NAME_REGEX, message: 'は全角文字で入力してください' }
  validates :first_name, format: { with: VALID_NAME_REGEX, message: 'は全角文字で入力してください' }

  # カナは全角カタカナ
  VALID_KANA_REGEX = /\A[ァ-ンー－]+\z/
  validates :last_name_kana, format: { with: VALID_KANA_REGEX, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, format: { with: VALID_KANA_REGEX, message: 'は全角カタカナで入力してください' }
end
