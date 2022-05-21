require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Likes Validation' do
    it 'likesCounterr should be one' do
      user = User.new(name: 'Esther Alice', post_counter: 0)
      user.save

      post = Post.new(title: 'Alice in wonderlands', text: 'Beware the Jabberwock, my son!', commentsCounter: 1,
                      likesCounter: 0, author_id: user.id)
      post.save

      like = Like.new(author_id: user.id, post_id: post.id)
      like.save

      expect(like.post.likesCounter).to eq(1)
    end
  end
end
