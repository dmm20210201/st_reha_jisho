class Rehabilitation < ApplicationRecord

  belongs_to :user
  attachment :training_image
  has_many :rehabilitation_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :training_name, presence: true
  validates :speech_pathological_findings, presence: true
  validates :adaptation_precautions, presence: true
  validates :training_content, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
