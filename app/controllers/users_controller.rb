class UsersController < ApplicationController

  # what routes do I need for login?

  # renders our login form
  get "/login" do
    erb :"/users/login"
  end

  # this route actually logs our user in
  post "/login" do
    # recieve params from form inputs
    # find the user based on email params
    # authenticate my user
    # create a key/value pair in sessions hash ex: session[:user_id] = 1
  end

end
