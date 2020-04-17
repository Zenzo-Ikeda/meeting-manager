class PasswordsController < ApplicationController
  before_action :require_user_logged_in
  
  def show
    redirect_to login_url
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    current_password = params[:user][:current_password]
    
    if current_password.present?
     if @user.authenticate(current_password)
       @user.assign_attributes(edit_user_params)
       if @user.save
         flash[:success] = 'パスワードを変更しました。'
         redirect_to @user
       else
         flash.now[:danger] = 'パスワードの変更に失敗しました。'
         render :edit
       end
      else
        flash.now[:danger] = '現在のパスワードが一致しません。'
        render :edit
     end
    end
  end
  
  private
  def edit_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
