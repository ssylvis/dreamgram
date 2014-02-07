module UsersHelper
  def facebook_share_link(account)
    host = 'https://www.facebook.com/dialog/feed'
    dream = account.dreams.first
    url = user_url(:uid => account.uid)
    params = {
      :app_id => '1387078131558211',
      :caption => dream.description,
      :description => t('users.social.description'),
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
      :text => t('users.social.description'),
      :url => user_url(:uid => account.uid)
    }
    "#{host}?#{params.to_param}"
  end
end
