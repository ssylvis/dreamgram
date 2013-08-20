module SessionsHelper
  def current_user?(user)
    current_user == user
  end

  def logged_in?
    current_user.present?
  end

  def login(user)
    session[:remember_token] = user.id
    self.current_user = user
  end

  def login_required
    redirect_to login_url unless logged_in?
  end

  def logout
    session.delete(:remember_token)
    self.current_user = nil
  end

private

  def current_user
    @current_user ||= (User.find(session[:remember_token]) if session[:remember_token])
  end

  def current_user=(user)
    @current_user = user
  end
end
