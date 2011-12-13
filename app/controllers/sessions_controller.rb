class SessionsController < ApplicationController
  def create
    data = request.env["omniauth.auth"]
    twitter_user_id = data['uid']
    provider = data['provider']
    name = data['info']['name']
    logger.debug "User ID looks to be: #{twitter_user_id}"
    logger.debug "Name looks to be: #{name}"
    
    user = User.find_by_uid(twitter_user_id)
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "#{name} signed in"
    else
      user = User.create(:uid => twitter_user_id, :provider => provider, :name => name)
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Hi #{name}, welcome"
    end
  end

  def destroy
  end

end
