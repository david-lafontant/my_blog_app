class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_comments_counter
    post.increment!(:commentsCounter)
  end

  after_create :increment_comments_counter
  after_destroy :decrement_comments_counter

  private def increment_comments_counter
    post.increment!(:commentsCounter)
  end

  private def decrement_comments_counter
    post.decrement!(:commentsCounter)
  end

end
