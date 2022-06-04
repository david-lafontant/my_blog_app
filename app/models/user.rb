class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  has_many :posts, class_name: 'Post', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy

  validates :name, presence: true
  validates :postsCounter, presence: true, numericality: { only_integer: true },
                           comparison: { greater_than_or_equal_to: 0 }

  after_initialize :default_values

  def most_recent_posts(items = 3)
    posts.order(created_at: :desc).take(items)
  end

  def posts_desc_order
    posts.order(created_at: :desc)
  end

  private

  def default_values
    return unless new_record?


    self.photo ||= 'user_photo.png'
    self.postsCounter ||= 0
    self.role ||= 'default'
    self.bio ||= 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'

  end
end
