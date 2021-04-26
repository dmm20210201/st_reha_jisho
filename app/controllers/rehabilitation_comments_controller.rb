class RehabilitationCommentsController < ApplicationController
  def create
    @rehabilitation = Rehabilitation.find(params[:rehabilitation_id])
    @new_rehabilitation_comment = RehabilitationComment.new
    comment = current_user.rehabilitation_comments.new(rehabilitation_comment_params)
    comment.rehabilitation_id = @rehabilitation.id
    if comment.save
      comment.create_notification(Rehabilitation.find(comment.rehabilitation_id).user_id, current_user.id, comment.id)
    end
  end

  def destroy
    @rehabilitation = Rehabilitation.find(params[:rehabilitation_id])
    @new_rehabilitation_comment = RehabilitationComment.new
    comment = current_user.rehabilitation_comments.find(params[:id])
    comment.destroy
  end

  private

  def rehabilitation_comment_params
    params.require(:rehabilitation_comment).permit(:comment, :reply_comment)
  end
end
