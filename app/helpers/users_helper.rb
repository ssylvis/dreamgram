module UsersHelper
  def facebook_share_link(account)
    url = user_url(:uid => account.uid)
    if Rails.env.production?
      host = 'https://www.facebook.com/dialog/feed'
      params = {
        :app_id => '1387078131558211',
        :description => 'Check out my bucketlist on Dreamgram!',
        :display => 'popup',
        :link => url,
        :name => 'Dreamgram',
        :url => url
      }
    else
      host = 'https://www.facebook.com/sharer/sharer.php'
      params = { :u => url }
    end
    "#{host}?#{params.to_param}"
  end

  def twitter_share_link(account)
    host = 'https://twitter.com/share'
    params = {
      :text => 'Check out my bucketlist on Dreamgram!',
      :url => user_url(:uid => account.uid)
    }
    "#{host}?#{params.to_param}"
  end
end
