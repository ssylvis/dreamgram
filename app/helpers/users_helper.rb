module UsersHelper
  def facebook_share_link(account)
    host = 'https://www.facebook.com/sharer/sharer.php'
    params = {:u => user_url(:uid => account.uid)}
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
