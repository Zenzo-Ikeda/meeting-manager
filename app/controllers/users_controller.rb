class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :check_admin, only: [:new, :create]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)

      if @user.save
        flash[:success] = 'ユーザを登録しました。'
        redirect_to @user
      else
        flash.now[:danger] = 'ユーザの登録に失敗しました。'
        render :new
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def check_admin
    unless current_user&.admin?
      redirect_to login_url 
    end
  end
  
  
  
end
