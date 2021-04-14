class RehabilitationCommentsController < ApplicationController
  def create
    @rehabilitation = Rehabilitation.find(params[:rehabilitation_id])
    comment = current_user.rehabilitation_comments.new(rehabilitation_comment_params)
    comment.rehabilitation_id = @rehabilitation.id
    comment.save
  end

  def destroy
    # RehabilitationComment.find_by(id: params[:id], rehabilitation_id: params[:rehabilitation_id]).destroy
    @rehabilitation = Rehabilitation.find(params[:rehabilitation_id])
    comment = current_user.rehabilitation_comments.find_by(rehabilitation_comment_params)
    comment.destroy
    # redirect_to rehabilitation_path(params[:rehabilitation_id])
  end

  private
  def rehabilitation_comment_params
    params.require(:rehabilitation_comment).permit(:comment)
  end
end
