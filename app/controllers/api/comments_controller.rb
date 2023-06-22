class Api::CommentsController < ActionController::Base
  protect_from_forgery with: :null_session

  def index
    @comments = Comment.where(post_id_id: params[:post_id])
    render json: @comments
  end

  def create
    message = 'Invalid credentials'
    @user = User.find_by_id(params[:user_id])
    if @user.present?
      @post = Post.find_by_id(params[:post_id])
      if @post.present?
        @comment = Comment.new(author: @user, post: @post, text: params[:text])
        message = if @comment.save
                    'Comment created'
                  else
                    'There was an error'
                  end
      else
        message = 'No Post available'
      end
    else
      message = 'No User avilable'
    end

    render json: message
  end
end
