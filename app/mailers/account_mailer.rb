class AccountMailer < ActionMailer::Base
  ADMIN_ADDRESS = 'Admin <ssylvis+dreamgram@gmail.com'

  default :from => 'Dreamgram <no-reply@dreamgr.am>'

  def account_created(account)
    @account = account
    mail :to => ADMIN_ADDRESS, :subject => t('.subject')
  end

  def account_deleted(account)
    @account = account
    mail :to => ADMIN_ADDRESS, :subject => t('.subject')
  end
end
