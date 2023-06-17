class LikeController < ApplicationController
  def create
    @like = Like.new(author_id_id: params[:user_id], post_id_id: params[:post_id])
    if @like.save
      # Successful save
      redirect_to "/users/1/posts/#{params[:post_id]}"
    else
      # Failed save
      flash[:error] = 'Failed to create like'
    end
  end
end
