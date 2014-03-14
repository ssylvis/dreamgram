class AuthenticationController < Devise::OmniauthCallbacksController
  include Application::OauthHandling
  include Devise::Controllers::Rememberable

  def facebook
    authenticate_request(:facebook)
  end

  def google
    authenticate_request(:google)
  end

  private

  def authenticate_request(provider)
    provider_name = provider.to_s.capitalize
    auth = request.env['omniauth.auth']
    # sign in existing accounts whether login or signup request
    if oauth = Oauth.find_by_provider(auth.provider, auth.uid)
      set_flash(:notice, :already_registered, :provider => provider_name) unless login_request?
      account = oauth.account
      remember_me account
      sign_in_and_redirect account
    else
      if login_request?
        set_flash(:alert, :invalid)
        redirect_to new_account_session_path
      else
        self.class.save_oauth_data(session, auth)
        # check whether we have an existing account
        if account = Account.find_by_email(auth.info.email)
          set_flash(:notice, :already_registered, :provider => existing_providers(account))
          account.oauths.create!(oauth_create_params(account))
          sign_in_and_redirect account
        else
          set_flash(:notice, :oauth_signup, :provider => provider_name)
          redirect_to new_account_registration_path
        end
      end
    end
  end

  private

  def existing_providers(account)
    account.oauths.map { |oauth| oauth.provider.to_s.capitalize }.join(', ') || 'email'
  end

  def login_request?
    request.env['omniauth.origin'] == new_account_session_url
  end

  def oauth_create_params(account)
    self.class.oauth_data(session).slice(:provider, :provider_uid).merge(:account => account)
  end

  def set_flash(key, kind, args = {})
    set_flash_message(key, kind, args) if is_flashing_format?
  end
end
