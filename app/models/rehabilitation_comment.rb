class RehabilitationComment < ApplicationRecord
  belongs_to :user
  belongs_to :rehabilitation
end