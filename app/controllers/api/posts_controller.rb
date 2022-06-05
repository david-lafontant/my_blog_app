class Api::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts_desc_order
    render json: @posts, status: :ok
  end
end
