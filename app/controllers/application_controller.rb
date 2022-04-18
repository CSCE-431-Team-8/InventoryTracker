class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

private

  def require_login
    unless session[:user_id]
      redirect_to "/auth/google_oauth2"
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
