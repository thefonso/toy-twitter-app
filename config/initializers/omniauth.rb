Rails.application.config.middleware.use OmniAuth::Builder do
  # TODO how to hide the key and secret?...
  provider :twitter, "uNi2i7MxLlwjrGuNSAwzw", "4bd03PWG5jFBkfPHrXR1UeaXNQkDXBnApkBprNDSaA" 
  # provider :twitter, "consumer_key", "consumer_secret" 
end