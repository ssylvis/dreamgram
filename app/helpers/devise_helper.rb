module DeviseHelper
  def confirm_email_alert?
    flash[:alert].present? && flash[:alert].include?('confirm')
  end
end
