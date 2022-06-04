class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @post = Post.find(params[:post_id])
    render :new, locals: { user: @current_user, post: @post }
  end

  def destroy
    @comment = Comment.find(params[:post][:comment_id])
    comment_user_id = @comment.user.id
    @comment.destroy
    redirect_to user_url(comment_user_id)
  end

  def create
    @current_user = current_user
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_url(@post.user.id, @post.id)
    else
      flash.now[:error] = @comment.errors.full_messages.to_sentence
      render :new, locals: { user: @current_user, post: @post }, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
