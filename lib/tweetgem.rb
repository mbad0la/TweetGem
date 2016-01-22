require 'http'
require 'base64'
class Tweetapi
  KEY = 'CV2aMxKrMiGZjGLdw9YvdLTpF'
  SECRET = 'aPKOronl16SNDAzo681gtSkQRFCfWPl6bROqpCCTTsPzithFuO'
  def initialize
    @encoded = Base64.encode64(KEY<<':'<<SECRET)
    @basic_auth = ""
    @encoded.split("").each {|c|
      unless c == "\n"
        @basic_auth<<c
      end
    }
    @basic_auth = "Basic "<<@basic_auth
    response = HTTP.auth(@basic_auth).headers("Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8").post("https://api.twitter.com/oauth2/token", :body => "grant_type=client_credentials")
    puts response.body
  end
  
end

instance = Tweetapi.new