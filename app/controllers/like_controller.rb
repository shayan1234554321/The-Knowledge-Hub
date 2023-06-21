class LikeController < ApplicationController
  def create
    @like = Like.new(author_id_id: current_user.id, post_id_id: params[:post_id])
    if @like.save
      # Successful save
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    else
      # Failed save
      flash[:error] = 'Failed to create like'
    end
  end
end
