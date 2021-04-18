class RehabilitationComment < ApplicationRecord
  belongs_to :user
  belongs_to :rehabilitation

  validates :comment, presence: true

end
