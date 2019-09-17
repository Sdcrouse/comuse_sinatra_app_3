require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable sessions
    enable :sessions
    # set session secret for extra layer of security
    set :session_secret, "our_super_secret_session_secret"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do
    # method to keep track of logged in user
    def current_user
      # find a the current user
      @user ||= User.find_by(id: session[:user_id])
    end

    # check to see if a user is logged in
    def logged_in?
      #will return a boolean (true or false)
      !!current_user
    end
  end

end
