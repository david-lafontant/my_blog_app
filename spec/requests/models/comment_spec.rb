require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    User.destroy_all
    Post.destroy_all
    Comment.destroy_all

    @user = User.create(name: 'gaby', email: 'gaby@gmail.com', password: 'password', confirmed_at: Time.now)

    @post = Post.create(
      user: @user,
      title: 'My first post',
      text: 'This is the first post of gaby',
      commentsCounter: 0,
      likesCounter: 0
    )

    @comment = Comment.create(text: 'This is a comment for My first post', user: @user, post: @post)
  end

  context '#user' do
    it 'should be present' do
      @comment.user = nil
      expect(@comment).to_not be_valid
    end
  end

  context '#post' do
    it 'should be present' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end
  end

  context '#text' do
    it 'should be present' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end
  end

  describe '#method' do
    before :all do
      @user_b = User.create(name: 'sara', email: 'sara@gmail.com', password: 'password', confirmed_at: Time.now)
      @post_b = Post.create(user: @user_b, title: 'post A', text: 'text A', commentsCounter: 0, likesCounter: 0)
      Comment.create(user: @user_b, post: @post_b, text: 'comment A')
      @comment_b = Comment.create(user: @user_b, post: @post_b, text: 'comment B')
    end

    context '#increment_comments_counter' do
      it 'should incremment the Post&apos;s commentsCounter attribute to from 0 to 2' do
        expect(@post_b.commentsCounter).to eq 2
      end
    end

    context '#decrement_comments_counter' do
      it 'should decrement the Post&apos;s commentsCounter attribute to from 2 to 1' do
        @comment_b.destroy
        expect(@post_b.commentsCounter).to eq 1
      end
    end
  end
end
