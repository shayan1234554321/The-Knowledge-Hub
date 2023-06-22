class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = User.includes(:posts, :comments).find_by_id(params[:user_id])
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:post_id])
  end

  def create
    @post = Post.new(post_params.merge(author_id_id: current_user.id, comments_counter: 0, likes_counter: 0))

    if @post.save
      # Successful save
      redirect_to user_post_path(current_user, @post)
    else
      # Failed save
      flash[:error] = 'Failed to create post'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    # Delete associated likes and comments
    Like.where(post_id_id: @post.id).delete_all
    Comment.where(post_id_id: @post.id).delete_all

    @post.destroy

    redirect_to user_posts_path(@user), notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def authenticate_user!
    return if user_signed_in?

    redirect_to new_user_session_path
  end

end
