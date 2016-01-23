require "base64"
require "http"

module AppAuth
        
  KEY = "*************************"
  SECRET = "**************************************************"
  
  def AppAuth.init()
    basic_auth = "Basic "<<Base64.strict_encode64("#{KEY}:#{SECRET}")
    response = HTTP.auth(basic_auth).headers("Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8").post("https://api.twitter.com/oauth2/token", :body => "grant_type=client_credentials")
    return JSON.parse(response.body)["access_token"]
  end
  
  def AppAuth.user_timeline(bearer,screen_name,count=10)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/statuses/user_timeline.json", :params => {"screen_name" => screen_name, "count" => count})
    return JSON.parse(response.body)
  end
  
  def AppAuth.user_show(bearer,screen_name,include_user_entities = false,trim = true)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/users/show.json", :params => {"screen_name" => screen_name, "include_user_entities" => include_user_entities})
    if response.code != 200
      puts "Something went wrong in retreiving information on "<<screen_name
    end
    response = JSON.parse(response.body)
    trim_info = {
      "name" => response["name"],
      "screen_name" => response["screen_name"],
      "description" => response["description"],
      "url" => response["url"],
      "profile_pic" => response["profile_image_url_https"],
      "followers" => response["followers_count"],
      "friends" => response["friends_count"]
    }
    return trim == true ? trim_info : response
  end
  
  def AppAuth.user_recent_followers(bearer,screen_name,trim = true)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/followers/list.json", :params => {"screen_name" => screen_name, "count" => 50, "skip_status" => trim, "include_user_entities" => false})
    if response.code != 200
      puts "Something went wrong in retreiving followers for "<<screen_name
    end
    response = JSON.parse(response.body)["users"]
    trim_info = []
    trim_info.push(response.length)
    response.each do |follower|
      trim_info.push({"name" => follower["name"],"screen_name" => follower["screen_name"],"profile_pic" => follower["profile_image_url_https"],"description" => follower["description"]})
    end
    return trim == true ? trim_info : response
  end

end