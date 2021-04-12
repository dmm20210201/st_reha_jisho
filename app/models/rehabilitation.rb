class Rehabilitation < ApplicationRecord

  belongs_to :user
  attachment :training_image
  has_many :rehabilitation_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
