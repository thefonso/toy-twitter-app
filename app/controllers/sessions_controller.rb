require 'twitter'

class SessionsController < ApplicationController
  def create
    data = request.env["omniauth.auth"]
    twitter_user_id = data['uid']
    provider = data['provider']
    name = data['info']['name']
    image = data['info']['image']
    logger.debug "User ID looks to be: #{twitter_user_id}"
    logger.debug "Name looks to be: #{name}"
    
    # Set all necessary auth info (I think these are MY keys that exist in omniauth.rb)
    Twitter.consumer_key = 'HlVU1IJ6MWv7uPLe6h5Zw'
    Twitter.consumer_secret = 'nMrQocQAizOfUXqfezvqehRSAVIdzyyy4tT4L4ghJ4'
    Twitter.oauth_token = data['credentials']['token']
    Twitter.oauth_token_secret = data['credentials']['secret']
    
    user = User.find_by_provider_and_uid(data['provider'], data['uid'])|| User.create_with_omniauth(data)
    #user = User.find_by_uid(twitter_user_id)
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "#{name} signed in"
    else
      user = User.create(:uid => twitter_user_id, :provider => provider, :name => name,
              :image => image, :token => Twitter.oauth_token, :secret => Twitter.oauth_token_secret)
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Hi #{name}, thanks for signing in"
    end
  end

  def destroy
    session[:user_id] = nil
    Twitter.end_session
    redirect_to root_url, :notice => "Signed out! pong"
  end

end
