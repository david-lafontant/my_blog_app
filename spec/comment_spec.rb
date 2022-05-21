require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comments Validation' do
    it 'comments_counter should be two' do
      user = User.new(name: 'Esther alice', post_counter: 0)
      user.save
      post = Post.new(title: 'Alice in wonderlands', text: 'Alice in wonderlands', commentsCounter: 1, likesCounter: 0,
                      author_id: user.id)
      post.save

      comment = Comment.new(author_id: user.id, post_id: post.id)
      comment.save

      expect(comment.post.commentsCounter).to eq(2)
    end
  end
end
