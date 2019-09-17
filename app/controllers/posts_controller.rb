class PostsController < ApplicationController

  # CRUD

  # READ - INDEX
  get "/posts" do
    @posts = Post.all
    erb :"posts/index"
  end

  # CREATE
  get "/posts/new" do
    # render form to create post
    erb :"/posts/new"
  end

  post "/posts" do
    # recieves the params from the form
    # using the params i will create the post
    # IMPORTANT NOTE: we want validations 
    @post = Post.create(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
    redirect "/posts/#{@post.id}"
  end

  # READ - SHOW
  get "/posts/:id" do
    # this is a dynamic route
    @post = Post.find(params[:id])
    # render the show page
    erb :"posts/show"
  end

  # UPDATE

  # DELETE

end
