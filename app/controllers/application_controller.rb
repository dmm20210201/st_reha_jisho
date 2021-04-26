class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    rehabilitations_path
  end

  def set_search
    @search = Rehabilitation.ransack(params[:q])
    @rehabilitations = @search.result.page(params[:page]).reverse_order
  end

  def notification
    #current_userの投稿に紐づいた通知一覧
    @notifications = current_user.passive_notifications
    #@notificationの中でまだ確認していない通知のみ
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :affiliation])
  end
end
