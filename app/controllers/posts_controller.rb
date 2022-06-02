class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user = User.includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @current_user = current_user
  end

  def create
    @current_user = current_user
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post added successfully'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      render :new
    end
  end

  private def post_params
    params.require(:post).permit(:title, :text)
  end
end
