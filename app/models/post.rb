class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:post_counter)
  end

  def recent_comments
    comments.last(5)
  end
end
