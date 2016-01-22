require "base64"
require "http"

module Appauth
        
  KEY = "*************************"
  SECRET = "**************************************************"
           
  def Appauth.B64rify(value)
    value = Base64.encode64(value)
    outputvalue = ""
    value.split("").each do |c|
      outputvalue<<c unless c == "\n"
    end
    return outputvalue
  end
  
  def Appauth.init()
    basicauth = "Basic "<<B64rify(KEY<<":"<<SECRET)
    response = HTTP.auth(basicauth).headers("Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8").post("https://api.twitter.com/oauth2/token", :body => "grant_type=client_credentials")
    return JSON.parse(response.body)["access_token"]
  end
  
  def Appauth.user_timeline(bearer,screen_name,count=10)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/statuses/user_timeline.json", :params => {"screen_name" => screen_name, "count" => count})
    return JSON.parse(response.body)
  end

end