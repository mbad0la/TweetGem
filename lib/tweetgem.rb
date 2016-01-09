require 'httparty'
require_relative 'auth/appauth'

class Tweetapi

  def initialize()
    appauthInit()
  end
  
end

instance = Tweetapi.new