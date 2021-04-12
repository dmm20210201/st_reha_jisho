class Rehabilitation < ApplicationRecord

  belongs_to :user
  attachment :training_image
  has_many :rehabilitation_comments, dependent: :destroy

end
