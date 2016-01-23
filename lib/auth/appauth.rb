require "base64"
require "http"

module AppAuth
  
  KEY = "*************************"
  SECRET = "**************************************************"      
  
  def AppAuth.init()
    basic_auth = "Basic "<<Base64.strict_encode64("#{KEY}:#{SECRET}")
    response = HTTP.auth(basic_auth).headers("Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8").post("https://api.twitter.com/oauth2/token", :body => "grant_type=client_credentials")
    if response.code != 200
      return nil
    else
      return JSON.parse(response.body)["access_token"]
    end
  end
  
  def AppAuth.user_timeline(bearer,screen_name,count=10)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/statuses/user_timeline.json", :params => {"screen_name" => screen_name, "count" => count})
    if response.code != 200
      return nil
    else
      return JSON.parse(response.body)
    end
  end
  
  def AppAuth.user_show(bearer,screen_name,trim = true,include_user_entities = false)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/users/show.json", :params => {"screen_name" => screen_name, "include_user_entities" => include_user_entities})
    if response.code != 200
      return nil
    else
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
  end
  
  def AppAuth.user_newest_followers(bearer,screen_name,trim = true)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/followers/list.json", :params => {"screen_name" => screen_name, "count" => 30, "skip_status" => trim, "include_user_entities" => false})
    if response.code != 200
      return nil
    else
      response = JSON.parse(response.body)["users"]
      trim_info = {}
      trim_info["objects"] = response.length
      trim_info["users"] = []
      response.each do |follower|
        trim_info["users"].push({"name" => follower["name"],"screen_name" => follower["screen_name"],"profile_pic" => follower["profile_image_url_https"],"description" => follower["description"]})
      end
      return trim == true ? trim_info : response
    end
  end
  
  def AppAuth.user_newest_friends(bearer,screen_name,trim = true)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/friends/list.json", :params => {"screen_name" => screen_name, "count" => 30, "skip_status" => trim, "include_user_entities" => false})
    if response.code != 200
      return nil
    else
      response = JSON.parse(response.body)["users"]
      trim_info = {}
      trim_info["objects"] = response.length
      trim_info["users"] = []
      response.each do |follower|
        trim_info["users"].push({"name" => follower["name"],"screen_name" => follower["screen_name"],"profile_pic" => follower["profile_image_url_https"],"description" => follower["description"]})
      end
      return trim == true ? trim_info : response
    end
  end
  
  def AppAuth.lists(bearer,screen_name,reverse)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/lists/list.json", :params => {"screen_name" => screen_name, "reverse" => reverse})
    if response.code != 200
      return nil
    else
      return JSON.parse(response.body)
    end
  end
  
  def AppAuth.lists_owner(bearer,username,count)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/lists/ownerships.json", :params => {"screen_name" => username, "count" => count})
    if response.code != 200
      return nil
    else
      return JSON.parse(response.body)
    end
  end
  
  def AppAuth.lists_subscription(bearer,username,count)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/lists/subscriptions.json", :params => {"screen_name" => username, "count" => count})
    if response.code != 200
      return nil
    else
      return JSON.parse(response.body)
    end
  end
  
  def AppAuth.list_recent_favourites(bearer,username,count)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/favorites/list.json", :params => {"screen_name" => username, "count" => count, "include_entities" => false})
    if response.code != 200
      puts response.code
      return nil
    else
      return JSON.parse(response.body)
    end
  end
  
  def AppAuth.global_trend(bearer)
    response = HTTP.auth("Bearer "<<bearer).get("https://api.twitter.com/1.1/trends/place.json", :params => {"id" => 1})
    if response.code != 200
      return nil
    else
      return JSON.parse(response.body)
    end
  end

end