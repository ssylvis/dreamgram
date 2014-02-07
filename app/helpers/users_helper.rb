module UsersHelper
  def facebook_share_link(account)
    host = 'https://www.facebook.com/dialog/feed'
    dream = account.dreams.sample
    url = user_url(:uid => account.uid)
    params = {
      :app_id => '1387078131558211',
      :description => t('users.social.description', :dream => dream.description),
      :display => 'popup',
      :link => url,
      :name => t('users.social.name'),
      :picture => dream.image,
      :redirect_uri => url
    }
    "#{host}?#{params.to_param}"
  end

  def twitter_share_link(account)
    host = 'https://twitter.com/share'
    params = {
      :text => t('users.social.tweet'),
      :url => user_url(:uid => account.uid)
    }
    "#{host}?#{params.to_param}"
  end
end
