class PostsController < ApplicationController

  # CRUD

  # READ - INDEX
  get "/posts" do
    @posts = Post.all
    erb :"posts/index"
  end

  # CREATE
  get "/posts/new" do
    if logged_in?
      # render form to create post
      erb :"/posts/new"
    else
      # redirects my user if they're not logged in
      flash[:error] = "You must be logged in to create a post!"
      redirect '/'
    end
  end

  post "/posts" do
    # recieves the params from the form
    # using the params i will create the post
    # IMPORTANT NOTE: we want validations
    @post = Post.new(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
    if @post.save
      flash[:message] = "Post succesfully created!"
      redirect "/posts/#{@post.id}"
    else
      #show post creation fail error messages
      flash[:error] = "Post creation failure: #{@post.errors.full_messages.to_sentence}"
      redirect "/posts/new"
    end
  end

  # READ - SHOW
  get "/posts/:id" do
    # this is a dynamic route
    @post = Post.find(params[:id])
    # render the show page
    erb :"posts/show"
  end

  # UPDATE
    # implement Sinatra middleware 'MethodOverride' to intercept every request sent and override to perscribed method using a hidden input in our forms
      # for PATCH and DELETE
    # get route to "/posts/:id/edit" to render edit form
      # we need to add a hidden input to point to our patch route
    #patch route to "/posts/:id" to do .update on a post instance

    get '/posts/:id/edit' do
      @post = Post.find(params[:id])
      if authorized_to_edit?(@post)
        erb :'/posts/edit'
      else
        flash[:error] = "You must be authorized to edit that post."
        redirect '/posts'
      end
    end

    # patch route to update a existing post
    patch '/posts/:id' do
      @post = Post.find(params[:id])
      @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])
      redirect "/posts/#{@post.id}"
    end

  # DELETE
    # render delete form on show page
      # we need to add a hidden input to point to our delete route
    # delete route to .destroy a post instance

      delete '/posts/:id' do
        # we need the id to FIND the post to delete
        @post = Post.find(params[:id])
        @post.destroy
        redirect '/posts'
      end


end
