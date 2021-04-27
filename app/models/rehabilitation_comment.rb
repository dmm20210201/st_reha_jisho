class RehabilitationComment < ApplicationRecord
  belongs_to :user
  belongs_to :rehabilitation
  has_many :notifications

  validates :comment, presence: true

  def create_notification(visited_id, visiter_id, comment_id)
    notification = Notification.new({
      visiter_id: visiter_id,
      visited_id: visited_id,
      rehabilitation_comment_id: comment_id,
      checked: false,
    })
    notification.save
  end
end
