module DeviseHelper
  include Application::OauthHandling

  def confirm_email_alert?
    flash[:alert].present? && flash[:alert].include?('confirm')
  end
end
