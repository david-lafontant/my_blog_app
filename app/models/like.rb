class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :likes
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', inverse_of: :likes

  validates :user, presence: true
  validates :post, presence: true
  validates :user_id, uniqueness: { scope: :post_id }

  after_create :increment_likes_counter
  after_destroy :decrement_likes_counter

  private

  def increment_likes_counter
    post.increment!(:likesCounter)
  end

  def decrement_likes_counter
    post.decrement!(:likesCounter)
  end
end
