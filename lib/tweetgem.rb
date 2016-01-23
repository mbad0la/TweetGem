require_relative "./auth/appauth"

class TweetApi
  
  attr_reader :me, :recent_followers
  
  def initialize(username,token = nil)
    token ||= AppAuth::init
    @bearer = token
    @me = AppAuth::user_show(@bearer,username)
    @recent_followers = AppAuth::user_recent_followers(@bearer,username)
  end
  
end

#instance = TweetApi.new("mbad0la")
#puts instance.recent_followers