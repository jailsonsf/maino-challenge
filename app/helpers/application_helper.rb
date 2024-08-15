module ApplicationHelper
  def require_login
    if !current_user
      redirect_to(new_user_session_path)
    end
  end
end
