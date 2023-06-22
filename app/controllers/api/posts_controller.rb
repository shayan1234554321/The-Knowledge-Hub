class Api::PostsController < ActionController::Base
  def index
    @posts = Post.includes(:comments).where(author_id_id: :user_id)
    render json: @posts
  end
end