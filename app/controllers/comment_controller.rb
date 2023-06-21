class CommentController < ApplicationController
  def create
    @comment = Comment.new(author_id_id: current_user.id, post_id_id: params[:post_id],
                           text: params[:comment][:text])
    if @comment.save
      # Successful save
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    else
      # Failed save
      flash[:error] = 'Failed to create comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to request.referrer
  end

end
