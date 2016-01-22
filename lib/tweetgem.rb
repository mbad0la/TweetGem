require "http"
require_relative "./auth/appauth"

class Tweetapi
  
  def initialize(username,token = nil)
    token ||= Appauth::init
    @bearer = token
    puts Appauth::user_timeline(@bearer,username)
  end
  
end

#instance = Tweetapi.new("mbad0la")