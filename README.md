# TweetGem
Twitter API methods for much productivity!

### Requirements
* [http](https://github.com/httprb/http)
* A registered application with [Twitter](https://apps.twitter.com/)
* Interest in using the Twitter API!

### Installation

    gem install tweetgem

### Introduction
Let's get the trending hashtags ( from recent 50 tweets per user ) from your new follows ( recent 30 )
```ruby
inst = TweetApi.new("mbad0la")
handles = []
counts = {}
friends = inst.get_newest_friends()
friends['objects'].times do |i|
  handles.push(friends['users'][i]['screen_name'])
end
handles.each do |v|
  puts "Running query for "<<v
  user_tweets = inst.timeline(v, 50)
  user_tweets.length.times do |i|
    hashtags = user_tweets[i]["entities"]["hashtags"]
    hashtags.each do |h|
      tag = h["text"]
      if counts.has_key? tag
        counts[tag] += 1
      else
        counts[tag] = 1
      end
    end
  end
end
counts = Hash[counts.sort_by{|k, v| v}.reverse]
counts.each do |k, v|
  puts "#{k} : #{v}"
end
```
For the moment, application-only authentication is used for requests.
Please set your application key and secret in _appauth.rb_ to be able to make requests to API endpoints.

Available methods :
* user_show(username,gist)
  * Returns details of a twitter user. By default returns details for the user used to instantiate the class object.
  * Set _gist_ parameter to _false_ to get the complete API response or else you'll be getting a *gist of the response*.
* timeline(username,count)
  * Returns a user's twitter timeline. By default returns the timeline for the user used to instantiate the class object.
  * Returns a maximum of _count_ tweets created/owned by the _username_. Defaults to a maximum of 10 tweets.
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
* search(hashtag)
  * Returns some tweets that have the hashtag _hashtag_ in them.
