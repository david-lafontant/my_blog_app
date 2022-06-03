class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, length: { maximum: 250 }, presence: true
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :increment_post_counter
  after_destroy :decrement_post_counter

  def increment_post_counter
    user.increment!(:post_counter)
  end

  def decrement_post_counter
    user.decrement!(:post_counter)
  end

  def recent_comments
    comments.last(5)
  end
end
