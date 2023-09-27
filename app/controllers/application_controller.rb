class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: current_user_id)
  end
  
  def current_user_id
    session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
