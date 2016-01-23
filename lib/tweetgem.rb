require_relative "./auth/appauth"

class TweetApi
  
  attr_reader :me, :newest_followers, :newest_friends
  
  def initialize(username,token = nil)
    token ||= AppAuth::init
    @bearer = token
    @me = AppAuth::user_show(@bearer,username)
    @screen_name = username
    @newest_followers = AppAuth::user_newest_followers(@bearer,username)
    @newest_friends = AppAuth::user_newest_friends(@bearer,username)
  end
  
  def user_show(username = nil,gist = true)
    username ||= @screen_name
    return AppAuth::user_show(@bearer,username,gist)
  end
  
  def get_newest_followers(username = nil,gist = true)
    username ||= @screen_name
    return AppAuth::user_newest_followers(@bearer,username,gist)
  end
  
  def get_newest_friends(username = nil,gist = true)
    username ||= @screen_name
    return AppAuth::user_newest_friends(@bearer,username,gist)
  end
  
  def lists(username = nil,ownership_first = false)
    username ||= @screen_name
    return AppAuth::lists(@bearer,username,ownership_first)
  end
  
  def lists_owner(username = nil,count = 30)
    username ||= @screen_name
    return AppAuth::lists_owner(@bearer,username,count)
  end
  
  def lists_subscription(username = nil,count = 30)
    username ||= @screen_name
    return AppAuth::lists_subscription(@bearer,username,count)
  end
  
  def list_recent_favourites(username = nil,count = 30)
    username ||= @screen_name
    return AppAuth::list_recent_favourites(@bearer,username,count)
  end
  
  def global_trend()
    return AppAuth::global_trend(@bearer)
  end
  
end