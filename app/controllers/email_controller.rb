class EmailController < ApplicationController
  def feedback
    feedback = feedback_param[:feedback]
    AccountMailer.user_feedback(current_account, feedback).deliver
    flash.now[:success] = I18n.t("email.feedback.email_sent")
  end

  private

  def feedback_param
    params.require(:email).permit(:feedback)
  end
end
