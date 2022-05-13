class PostsController < ApplicationController
  def index
    render 'post_list'
  end

  def show
    render 'post_details'
  end
end
