require 'twitter'

class SessionsController < ApplicationController
  def create
    #this chunk is using OAuth
    data = request.env["omniauth.auth"]
    twitter_user_id = data['uid']
    provider = data['provider']
    name = data['info']['name']
    image = data['info']['image']
    #here for debugging on the server output
    logger.debug "User ID looks to be: #{twitter_user_id}"
    logger.debug "Name looks to be: #{name}"
    
    # Set all necessary auth info (I think these are MY keys that exist in omniauth.rb)
    # NOTE these are for the twitter gem NOT Omniauth
    
    # TODO how to hide the key and secret lines?...
    Twitter.consumer_key = 'UkQrfL3DAfoLxzJFkbZbHg'
    Twitter.consumer_secret = '58pniCwUx67lW7TVR2xGH6qwgznTaWTgeodXZs4bLs8'
    Twitter.oauth_token = data['credentials']['token']
    Twitter.oauth_token_secret = data['credentials']['secret']
    # I don't recall why I put this here for user...
    #user = User.find_by_provider_and_uid(data['provider'], data['uid'])|| User.create_with_omniauth(data)
    #the below user string is from Jeff's tutorial..
    # if user exist in User database via find_by_uid
    user = User.find_by_uid(twitter_user_id)
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "#{name} signed in"
    else
      # it's a new user put 'em in the database!
      user = User.create(:uid => twitter_user_id, :provider => provider, :name => name,
              :image => image, :token => Twitter.oauth_token, :secret => Twitter.oauth_token_secret)
              
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Hi #{name}, thanks for signing in"
    end
  end

  def destroy
    session[:user_id] == nil
    Twitter.end_session
    redirect_to root_url, :notice => "Signed out!"
  end

end
