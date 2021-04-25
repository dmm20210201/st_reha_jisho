class RehabilitationCommentsController < ApplicationController
  def create
    @rehabilitation = Rehabilitation.find(params[:rehabilitation_id])
    @new_rehabilitation_comment = RehabilitationComment.new
    comment = current_user.rehabilitation_comments.new(rehabilitation_comment_params)
    comment.rehabilitation_id = @rehabilitation.id
    comment.save
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
