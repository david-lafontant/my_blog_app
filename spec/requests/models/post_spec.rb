require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    User.destroy_all
    Post.destroy_all

    @user = User.create(name: 'gaby', email: 'gaby@gmail.com', password: 'password', confirmed_at: Time.now)

    @post = Post.create(
      user: @user,
      title: 'My first post',
      text: 'This is the first post of gaby',
      commentsCounter: 0,
      likesCounter: 0
    )
  end

  context '#title' do
    it 'should be present' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'should not have more than 250 characters' do
      @post.title = 'a' * 260
      expect(@post).to_not be_valid
    end
  end

  context '#commentsCounter' do
    it 'should be present' do
      @post.commentsCounter = nil
      expect(@post).to_not be_valid
    end

    it 'should be an integer' do
      @post.commentsCounter = 1.5
      expect(@post).to_not be_valid
    end

    it 'should be greater than or equal to zero' do
      @post.commentsCounter = -1
      expect(@post).to_not be_valid
    end
  end

  context '#likesCounter' do
    it 'should be present' do
      @post.likesCounter = nil
      expect(@post).to_not be_valid
    end

    it 'should be an integer' do
      @post.likesCounter = 1.5
      expect(@post).to_not be_valid
    end

    it 'should be greater than or equal to zero' do
      @post.likesCounter = -1
      expect(@post).to_not be_valid
    end
  end

  describe '#method' do
    before :all do
      @user_a = User.create(name: 'any', email: 'any@gmail.com', password: 'password', confirmed_at: Time.now)
      @post_a = Post.create(user: @user, title: 'post A', text: 'text A', commentsCounter: 0, likesCounter: 0)
      Comment.create(user: @user_a, post: @post_a, text: 'comment A')
      Comment.create(user: @user_a, post: @post_a, text: 'comment B')
      Comment.create(user: @user_a, post: @post_a, text: 'comment C')
      Comment.create(user: @user_a, post: @post_a, text: 'comment D')
      Comment.create(user: @user_a, post: @post_a, text: 'comment E')
      Comment.create(user: @user_a, post: @post_a, text: 'comment F')
      Comment.create(user: @user_a, post: @post_a, text: 'comment G')
    end

    context '#most_recent_comments' do
      it 'should get the 5 most recent posts' do
        expect(@post_a.most_recent_comments.length).to eq 5
      end

      it 'should get the last comment as the first result' do
        expect(@post_a.most_recent_comments.first.text).to eq 'comment G'
      end

      it 'should get the third comment as the last result' do
        expect(@post_a.most_recent_comments.last.text).to eq 'comment C'
      end
    end

    context '#increment_posts_counter' do
      it 'should incremment the User&apos;s postsCounter attribute to from 1 to 2' do
        expect(@user.postsCounter).to eq 2
      end
    end

    context '#decrement_posts_counter' do
      it 'should decrement the User&apos;s postsCounter attribute to from 2 to 1' do
        @post_a.destroy
        expect(@user.postsCounter).to eq 1
      end
    end
  end
end
