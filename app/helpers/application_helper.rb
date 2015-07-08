module ApplicationHelper
  def full_title page_title = ""
    base_title = t "static_page.title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def required_admin
    unless user_signed_in? && admin_logging_in?
      flash[:danger] = t :required_admin_login
      redirect_to current_user.nil? ? login_path : current_user
    end
  end

  def admin_logging_in?
    # check admin role
  end
end
