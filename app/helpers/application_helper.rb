module ApplicationHelper
  def require_login
    if !current_user
      redirect_to(new_user_session_path, alert: I18n.t("activerecord.errors.messages.login_required"))
    end
  end
end
