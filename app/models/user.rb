class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rehabilitations, dependent: :destroy
  attachment :profile_image
  has_many :rehabilitation_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, length: {maximum: 20, minimum: 2}, presence: true
  validates :name_kana, length: {maximum: 20, minimum: 2}, presence: true
  validates :affiliation, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :introduction, length: { maximum: 50 }

end
