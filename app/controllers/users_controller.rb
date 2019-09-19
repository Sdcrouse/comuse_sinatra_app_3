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
      # on successful log in
      flash[:message] = "Welcome, #{user.name}!"
      # redirect to users profile
      redirect "/users/#{user.id}"
    else
      # show login error message
      flash[:error] = "Your credentials were invalid. Please try again!"
      # redirect back to the login
      redirect "/login"
    end
  end

  # users SHOW route
  get "/users/:id" do
    # find the user and save to instance
    @user = User.find_by(id: params[:id])
    # render with access to user instance variable
    erb:"/users/show"
  end

  #render sign up form
  get '/signup' do
    #render my sign form
    erb :"users/signup"
  end

  #create new user using sign up form
  post '/users' do
    @user = User.create(params)
    # logs the user in
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end

  #logs out user by clearing session hash
  get '/logout' do
    session.clear
    redirect '/'
  end

end
