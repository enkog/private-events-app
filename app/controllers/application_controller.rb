class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    return flash[:danger] = 'You must be logged in to perform this action' unless current_user
  end
end
