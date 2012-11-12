Rails.application.config.middleware.use OmniAuth::Builder do
  # TODO how to hide the key and secret?...
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'] 
  # provider :twitter, "consumer_key", "consumer_secret" 
end