class UsersController < ApplicationController
  def index
    render 'user_list'
  end

  def show
    render 'user_detail'
  end
end
