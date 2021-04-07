class Rehabilitation < ApplicationRecord

  belongs_to :user
  attachment :training_image

end
