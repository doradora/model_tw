# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  def require_is_admin
  	unless (current_user && current_user.is_admin?)
  		flash[:alert] = "請擁有管理者身份"
  		redirect_to root_path
  	end
  end
end
