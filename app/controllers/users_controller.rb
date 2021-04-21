class UsersController < ApplicationController

  before_action :ensure_correct_user
  before_action :ensure_normal_user, only: %i[update]


  def show
    @user = User.find(params[:id])
    @rehabilitations = @user.rehabilitations.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザー情報が更新されました"
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :name_kana, :affiliation, :introduction, :profile_image, :email )
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません'
    end
  end

end
