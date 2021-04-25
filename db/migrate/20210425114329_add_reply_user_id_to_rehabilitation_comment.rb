class AddReplyUserIdToRehabilitationComment < ActiveRecord::Migration[5.2]
  def change
    add_column :rehabilitation_comments, :reply_comment, :int
  end
end
