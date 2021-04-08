class RehabilitationsController < ApplicationController
  def index
    @rehabilitations = Rehabilitation.all
  end

  def new
    @rehabilitation = Rehabilitation.new
  end

  def create
    @rehabilitation = Rehabilitation.new(rehabilitation_params)
    @rehabilitation.user_id = current_user.id
    @rehabilitation.save
    redirect_to rehabilitations_path
  end

  def show
    @rehabilitation = Rehabilitation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @rehabilitation = Rehabilitation.find(params[:id])
    @rehabilitation.destroy
    redirect_to rehabilitations_path
  end

  private

  def rehabilitation_params
    params.require(:rehabilitation).permit(:training_name, :speech_pathological_findings, :adaptation_precautions, :items, :training_content, :training_image)
  end
end
