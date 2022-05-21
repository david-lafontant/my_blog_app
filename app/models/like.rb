class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likesCounter)
  end
end
