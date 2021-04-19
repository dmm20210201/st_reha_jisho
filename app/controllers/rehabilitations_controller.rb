class RehabilitationsController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def index
    unless params[:q]
      @rehabilitations = Rehabilitation.all.page(params[:page]).reverse_order
    end
    @favorite_ranks = Rehabilitation.find(Favorite.group(:rehabilitation_id).order('count(rehabilitation_id) desc').limit(5).pluck(:rehabilitation_id))
    @comment_ranks = Rehabilitation.find(RehabilitationComment.group(:rehabilitation_id).order('count(rehabilitation_id) desc').limit(5).pluck(:rehabilitation_id))
  end

  def new
    @rehabilitation = Rehabilitation.new
  end

  def create
    @rehabilitation = Rehabilitation.new(rehabilitation_params)
    @rehabilitation.user_id = current_user.id
    if @rehabilitation.save
      redirect_to rehabilitations_path, notice: "新しい訓練が投稿されました。"
    else
      render "new"
    end
  end

  def show
    @rehabilitation = Rehabilitation.find(params[:id])
    @rehabilitation_comment = RehabilitationComment.new
  end

  def edit
    @rehabilitation = Rehabilitation.find(params[:id])
  end

  def update
    @rehabilitation = Rehabilitation.find(params[:id])
    if @rehabilitation.update(rehabilitation_params)
      redirect_to rehabilitation_path(@rehabilitation.id), notice: "訓練が更新されました。"
    else
      render "edit"
    end
  end

  def destroy
    rehabilitation = Rehabilitation.find(params[:id])
    rehabilitation.destroy
    if params[:page] == "mypage"
      redirect_to request.referer
    else
      redirect_to rehabilitations_path
    end
  end

  private
  def rehabilitation_params
    params.require(:rehabilitation).permit(:training_name, :speech_pathological_findings, :adaptation_precautions, :items, :training_content, :training_image)
  end

  def correct_user
    rehabilitation = Rehabilitation.find(params[:id])
    user = rehabilitation.user
    if current_user != user
      redirect_to rehabilitation_path(rehabilitation.id)
    end
  end

end
