class PostsController < ApplicationController
  def index
    @current_user = current_user
    @user = User.find(params[:user_id])
    @posts_and_comments = @user.posts_desc_order.includes(:comments)
  end

  def show
    @current_user = current_user
    @post = Post.find(params[:id])
  end

  def new
    @current_user = current_user
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.new(post_params)
    @post.commentsCounter = 0
    @post.likesCounter = 0
    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_url(@current_user.id)
    else
      flash.now[:error] = @post.errors.full_messages.to_sentence
      render :new, locals: { user: @current_user }, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:post][:post_id])
    post_user_id = @post.user.id
    @post.destroy
    redirect_to user_url(post_user_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
