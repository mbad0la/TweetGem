require 'base64'

KEY = 'CV2aMxKrMiGZjGLdw9YvdLTpF'
SECRET = 'aPKOronl16SNDAzo681gtSkQRFCfWPl6bROqpCCTTsPzithFuO'
  
def appauthInit()
  basic_auth = KEY<<':'<<SECRET
  basic_auth = Base64.encode64(basic_auth)
  puts basic_auth
  headers = {'Authorization'=> 'Basic '<<basic_auth,'grant_type'=> 'client_credentials', 'Content-Type'=> 'application/x-www-form-urlencoded', 'Accept' => 'application/json'}
  response = HTTParty.post('https://api.twitter.com/oauth2/token',{:headers => headers})
  puts response.message
end