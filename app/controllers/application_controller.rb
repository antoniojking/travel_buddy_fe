class ApplicationController < ActionController::Base

  def current_user
    user = UserFacade.find_user(session[:user_id]) if session[:user_id]
  end
end
