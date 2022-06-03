class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_create :increment_likes_counter
  after_destroy :decrement_likes_counter

  private def increment_likes_counter
    post.increment!(:likesCounter)
  end

  private def decrement_likes_counter
    post.decrement!(:likesCounter)
  end
end

