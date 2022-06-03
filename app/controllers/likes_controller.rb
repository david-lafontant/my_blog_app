class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    flash[:notice] = @like.errors.full_messages.to_sentence unless @like.save
    redirect_to user_post_url(@like.user.id, @like.post.id)
  end

  def destroy
    @like = current_user.likes.find(params[:like][:like_id])
    current_post_id = params[:like][:post_id]
    post_user_id = Post.find(current_post_id).user.id
    @like.destroy
    redirect_to user_post_url(post_user_id, current_post_id)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
