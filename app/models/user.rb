class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(name: 'ゲスト', name_kana: 'ゲスト', affiliation: 'ゲスト病院', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  has_many :rehabilitations, dependent: :destroy
  attachment :profile_image
  has_many :rehabilitation_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  validates :name, presence: true, length: { maximum: 20, minimum: 2 }
  validates :name_kana, presence: true, length: { maximum: 20, minimum: 2 }
  validates :affiliation, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
