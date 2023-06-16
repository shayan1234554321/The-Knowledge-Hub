class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:id])
  end

  def create
    @post = Post.new( author_id_id: params[:user_id], title: params[:post][:title],
                     text: params[:post][:text], comments_counter: 0, likes_counter: 0)
    if @post.save
      # Successful save
      redirect_to "/users/#{params[:user_id]}/posts/#{@post.id}"
    else
      # Failed save
      flash[:error] = "Failed to create like"
    end
  end
end
