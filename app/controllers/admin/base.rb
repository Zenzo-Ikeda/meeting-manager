class Admin::Base < ApplicationController
  before_action :admin_login_required
  
  private 
  def admin_login_required
    redirect_to login_path unless current_user&.admin?
  end
end

    