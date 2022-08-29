class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :closets, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :calendars, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }

  def self.guest
    find_or_create_by!(email: 'guest@email') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'ゲスト'
    end
  end

  def prefecture_name
  JpPrefecture::Prefecture.find(code: prefecture_code).try(:name_e)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name_e: prefecture_name).code
  end

end