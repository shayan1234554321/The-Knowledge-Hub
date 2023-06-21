class UsersController < ApplicationController
  load_and_authorize_resource except: :sign_out_and_redirect

  def index
    @users = User.all
  end

  def show
    if params[:user_id] == 'sign_out'
      sign_out_and_redirect
    elsif user_signed_in?
      @user = User.includes(:posts, :comments).find_by_id(params[:user_id])
      @posts = @user.recent_posts
    end
  end

  def sign_out_and_redirect
    sign_out current_user
    redirect_to root_path
  end
end
