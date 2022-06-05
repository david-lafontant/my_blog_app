class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'user_id', inverse_of: :user, dependent: :destroy

  validates :name, presence: true
  validates :bio, presence: true
  validates :photo, presence: true
  validates :postsCounter, presence: true, numericality: { only_integer: true },
                           comparison: { greater_than_or_equal_to: 0 }

  after_initialize :default_values

  def most_recent_posts(items = 3)
    posts.order(created_at: :desc).take(items)
  end

  def posts_desc_order
    posts.order(created_at: :desc)
  end

  def generate_jwt
    JWT.encode({ id:,
                 exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end

  private

  def default_values
    return unless new_record?

    self.bio ||= 'Enter your abstract bio here.'
    self.photo ||= 'user-profile.png'
    self.postsCounter ||= 0
    self.role ||= 'default'
  end
end