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
    auth = request.env['omniauth.auth']
    # sign in existing accounts whether login or signup request
    if oauth = Oauth.find_by_provider(auth.provider, auth.uid)
      account = oauth.account
      remember_me account
      sign_in_and_redirect account
    else
      if login_request?
        set_flash_message(:alert, :invalid) if is_flashing_format?
        redirect_to new_account_session_path
      else
        # check whether we have an existing email account
        self.class.save_oauth_data(session, auth)
        if account = Account.find_by_email(auth.info.email)
          account.oauths.create!(oauth_create_params(account))
          sign_in_and_redirect account
        else
          provider_name = provider.to_s.capitalize
          set_flash_message(:notice, :oauth_signup, :provider => provider_name) if is_flashing_format?
          redirect_to new_account_registration_path
        end
      end
    end
  end

  private

  def login_request?
    request.env['omniauth.origin'] == new_account_session_url
  end

  def oauth_create_params(account)
    self.class.oauth_data(session).slice(:provider, :provider_uid).merge(:account => account)
  end
end
