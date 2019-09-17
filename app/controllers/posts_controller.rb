class PostsController < ApplicationController

  # CRUD

  # READ
  get "/posts" do
    @posts = Post.all
    erb :"posts/index"
  end

  get "/posts/:id" do 
    # this is a dynamic route
    @post = Post.find(params[:id])
    # render the show page
    erb :"posts/show"
  end

  # CREATE

  # UPDATE

  # DELETE

end
