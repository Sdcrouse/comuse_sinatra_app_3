class UsersController < ApplicationController

  # what routes do I need for login?

  # renders our login form
  get "/login" do
    erb :"/users/login"
  end

  # this route actually logs our user in
  post "/login" do
    # [x] recieve params from form inputs
    # [x] find the user based on email params
    user = User.find_by(email: params[:email])
    # [x] authenticate my user
    if user && user.authenticate(params[:password])
      # [x] create a key/value pair in sessions hash (this is what actually logs the user in) ex: session[:user_id] = 1
      session[:user_id] = user.id
      # redirect to users profile
      redirect "/users/#{user.id}"
    else
      # show login error message
      # redirect back to the login
      redirect "/login"
    end
  end

  # users SHOW route
  get "/users/:id" do
    # find the user and save to instance
    # render with access to user instance variable
  end

end
