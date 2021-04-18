class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    rehabilitations_path
  end

  def set_search
    @search = Rehabilitation.ransack(params[:q])
    @rehabilitations = @search.result.page(params[:page]).reverse_order
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
