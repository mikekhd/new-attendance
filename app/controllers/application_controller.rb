class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user
   
end
