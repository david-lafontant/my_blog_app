class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  after_save :update_posts_counter

  def self.update_posts_counter(user)
    count = user.posts.count
    user.update(posts_counter: count)
  end

end
