class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    user = UserFacade.current_user_info(session[:user_id]) if session[:user_id]
  end
end
