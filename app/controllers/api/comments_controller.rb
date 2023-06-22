class Api::CommentsController < ActionController::Base
  def index
    @comments = Comment.where(post_id_id: params[:post_id])
    render json: @comments
  end

  def create
    message = "Invalid credentials"
    @user = User.find_by_id(params[:user_id])
    if @user.present?
        @post = Post.find_by_id(params[:post_id])
        if @post.present?
            @comments = @comment = Comment.new(author: @user , post: @post , text: params[:text])
            if @comment.save
                message = "Comment created"
            else
                message = "There was an error"
            end
        else
          message = "No Post available"
        end
    else
      message = "No User avilable"
    end

    render json: message
  end
end