class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if params[:user_id] == 'sign_out'
      sign_out_and_redirect
    else
      if user_signed_in?
        @user = User.includes(:posts, :comments).find_by_id(params[:user_id])
        @posts = @user.recent_posts
      end
    end
  end

  def sign_out_and_redirect
    sign_out current_user
    redirect_to root_path
  end
end
