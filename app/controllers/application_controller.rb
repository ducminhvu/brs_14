class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def required_admin
    unless user_signed_in? && admin_logging_in?
      flash[:danger] = t :required_admin_login
      redirect_to current_user.nil? ? new_user_session_path : current_user
    end
  end

  def admin_logging_in?
    # check admin role
  end
end
