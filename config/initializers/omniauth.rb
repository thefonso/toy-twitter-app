Rails.application.config.middleware.use OmniAuth::Builder do
  # TODO how to hide the key and secret?...
  provider :twitter, "UkQrfL3DAfoLxzJFkbZbHg", "58pniCwUx67lW7TVR2xGH6qwgznTaWTgeodXZs4bLs8" 
  # provider :twitter, "consumer_key", "consumer_secret" 
end