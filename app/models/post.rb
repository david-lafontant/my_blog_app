class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', inverse_of: :posts
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id', inverse_of: :post, dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'post_id', inverse_of: :post, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :commentsCounter, presence: true, numericality: { only_integer: true },
                              comparison: { greater_than_or_equal_to: 0 }
  validates :likesCounter, presence: true, numericality: { only_integer: true },
                           comparison: { greater_than_or_equal_to: 0 }

  after_create :increment_posts_counter
  after_destroy :decrement_posts_counter

  def most_recent_comments(items = 5)
    comments.order(created_at: :desc).take(items)
  end

  private

  def increment_posts_counter
    user.increment!(:postsCounter)
  end

  def decrement_posts_counter
    user.decrement!(:postsCounter)
  end
end
