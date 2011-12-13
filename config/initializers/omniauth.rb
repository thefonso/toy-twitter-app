Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "HlVU1IJ6MWv7uPLe6h5Zw", "nMrQocQAizOfUXqfezvqehRSAVIdzyyy4tT4L4ghJ4" 
  # provider :twitter, "consumer_key", "consumer_secret" 
end