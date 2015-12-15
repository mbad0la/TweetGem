require 'httparty'

class Tweetapi
  
  def initialize()
  end
    
  def tempReq()
    response = HTTParty.get('https://api.github.com/users/mbad0la')
    puts response.body
  end
  
end