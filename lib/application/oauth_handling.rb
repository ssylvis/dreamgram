module Application
  module OauthHandling
    extend ActiveSupport::Concern

    OAUTH_SESSION_KEY = 'devise.oauth'

    included do
      def oauth_authenticated?
        session[OAUTH_SESSION_KEY].present?
      end
    end

    module ClassMethods
      def oauth_data(session)
        if oauth = session[OAUTH_SESSION_KEY]
          data = {
            :email => oauth.info.email,
            :first_name => oauth.info.first_name,
            :last_name => oauth.info.last_name,
            :provider => oauth.provider,
            :provider_uid => oauth.uid,
          }
        end
        data || {}
      end

      def save_oauth_data(session, auth)
        session[OAUTH_SESSION_KEY] = auth.except(:credentials, :extra)
      end
    end
  end
end
