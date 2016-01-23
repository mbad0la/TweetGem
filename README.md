# TweetGem
Twitter API methods for much productivity!

### Requirements
* [http](https://github.com/httprb/http)
* A registered application with [Twitter](https://apps.twitter.com/)
* Interest in using the Twitter API!

### Installation

    gem install tweetgem
    
### Introduction

```ruby
instance = TweetApi.new("mbad0la")
puts instance.me
#{"name"=>"Mayank Badola", "screen_name"=>"mbad0la", "description"=>"", "url"=>nil, "profile_pic"=>"https://abs.twimg.com/sticky/default_profile_images/default_profile_3_normal.png", "followers"=>5, "friends"=>82}
puts instance.user_show("sindresorhus",false)
#{"id"=>170686450, "id_str"=>"170686450", "name"=>"s̾i̾̾n̾̾̾̾d̾̾̾r̾̾e̾", "screen_name"=>"sindresorhus", "location"=>"✈", "profile_location"=>nil, "url"=>"https://sindresorhus.com", "description"=>"Aspiring rebel. ♥️ Node.js .•○°★☾ Creator of AVA, TodoMVC, @Yeoman. Blog: https://blog.sindresorhus.com", "protected"=>false, "followers_count"=>20995, "friends_count"=>175, "listed_count"=>775, "created_at"=>"Sun Jul 25 13:48:23 +0000 2010", "favourites_count"=>8826, "utc_offset"=>3600, "time_zone"=>"Stockholm", "geo_enabled"=>true, "verified"=>false, "statuses_count"=>9676, "lang"=>"en", "status"=>{"created_at"=>"Fri Jan 22 16:53:58 +0000 2016", "id"=>690578161155883008, "id_str"=>"690578161155883008", "text"=>"@dcaizergues The extension is for Chrome and Opera.", "source"=>"<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>", "truncated"=>false, "in_reply_to_status_id"=>690562284511457280, "in_reply_to_status_id_str"=>"690562284511457280", "in_reply_to_user_id"=>97392632, "in_reply_to_user_id_str"=>"97392632", "in_reply_to_screen_name"=>"dcaizergues", "geo"=>nil, "coordinates"=>nil, "place"=>nil, "contributors"=>nil, "is_quote_status"=>false, "retweet_count"=>0, "favorite_count"=>0, "entities"=>{"hashtags"=>[], "symbols"=>[], "user_mentions"=>[{"screen_name"=>"dcaizergues", "name"=>"Urban_Freakshow", "id"=>97392632, "id_str"=>"97392632", "indices"=>[0, 12]}], "urls"=>[]}, "favorited"=>false, "retweeted"=>false, "lang"=>"en"}, "contributors_enabled"=>false, "is_translator"=>false, "is_translation_enabled"=>false, "profile_background_color"=>"FAFAFA", "profile_background_image_url"=>"http://pbs.twimg.com/profile_background_images/378800000162762149/nc8yEsGJ.jpeg", "profile_background_image_url_https"=>"https://pbs.twimg.com/profile_background_images/378800000162762149/nc8yEsGJ.jpeg", "profile_background_tile"=>false, "profile_image_url"=>"http://pbs.twimg.com/profile_images/687354950125547520/v2PxJJ27_normal.png", "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/687354950125547520/v2PxJJ27_normal.png", "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/170686450/1452652634", "profile_link_color"=>"6B589A", "profile_sidebar_border_color"=>"FFFFFF", "profile_sidebar_fill_color"=>"DDEEF6", "profile_text_color"=>"333333", "profile_use_background_image"=>false, "has_extended_profile"=>false, "default_profile"=>false, "default_profile_image"=>false, "following"=>nil, "follow_request_sent"=>nil, "notifications"=>nil}
puts instance.lists_owner(nil,1)
#{"next_cursor"=>0, "next_cursor_str"=>"0", "previous_cursor"=>0, "previous_cursor_str"=>"0", "lists"=>[{"id"=>232843492, "id_str"=>"232843492", "name"=>"List test", "uri"=>"/mbad0la/lists/list-test", "subscriber_count"=>0, "member_count"=>0, "mode"=>"public", "description"=>"A list made to check out this feature", "slug"=>"list-test", "full_name"=>"@mbad0la/list-test", "created_at"=>"Sat Jan 23 09:35:28 +0000 2016", "following"=>false, "user"=>{"id"=>4442799560, "id_str"=>"4442799560", "name"=>"Mayank Badola", "screen_name"=>"mbad0la", "location"=>"", "description"=>"", "url"=>nil, "entities"=>{"description"=>{"urls"=>[]}}, "protected"=>false, "followers_count"=>5, "friends_count"=>82, "listed_count"=>0, "created_at"=>"Thu Dec 03 14:33:57 +0000 2015", "favourites_count"=>0, "utc_offset"=>nil, "time_zone"=>nil, "geo_enabled"=>false, "verified"=>false, "statuses_count"=>0, "lang"=>"en", "contributors_enabled"=>false, "is_translator"=>false, "is_translation_enabled"=>false, "profile_background_color"=>"C0DEED", "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png", "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png", "profile_background_tile"=>false, "profile_image_url"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_3_normal.png", "profile_image_url_https"=>"https://abs.twimg.com/sticky/default_profile_images/default_profile_3_normal.png", "profile_link_color"=>"0084B4", "profile_sidebar_border_color"=>"C0DEED", "profile_sidebar_fill_color"=>"DDEEF6", "profile_text_color"=>"333333", "profile_use_background_image"=>true, "has_extended_profile"=>false, "default_profile"=>true, "default_profile_image"=>true, "following"=>nil, "follow_request_sent"=>nil, "notifications"=>nil}}]}
```
For the moment, application-only authentication is used for requests.
Please set your application key and secret in _appauth.rb_ to be able to make requests to API endpoints. 

Available methods :
* user_show(username,gist)
  * Returns details of a twitter user. By default returns details for the user used to instantiate the class object.
  * Set _gist_ parameter to _false_ to get the complete API response or else you'll be getting a *gist of the response*.
* get_newest_followers(username,gist)
  * Returns details of a twitter users following _username_. By default returns details for the users following the user used to instantiate the class object.
  * Set _gist_ parameter to _false_ to get the complete API response or else you'll be getting a *gist of the response*.
* get_newest_friends(username,gist)
  * Returns details of a twitter users followed by _username_. By default returns details for the users followed by the user used to instantiate the class object.
  * Set _gist_ parameter to _false_ to get the complete API response or else you'll be getting a *gist of the response*.
* lists(username,ownership_first)
  * Returns a maximum of 100 lists created or subscribed by _username_. Subscribed lists are priortised in the response.
  * Set 'ownership_first' to _true_ to priortise created lists in the response.
* lists_owner(username,count)
  * Returns a maximum of _count_ lists created/owned by the _username_.
* lists_subscription(username,count)
  * Returns a maximum of _count_ lists subscribed by the _username_.
* list_recent_favourites(username,count)
  * Returns a maximum of _count_ tweets liked by _username_.
* global_trend()
  * Returns top 50 globally trending topics/hashtags.

    

    

    

