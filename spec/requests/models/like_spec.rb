require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    User.destroy_all
    Post.destroy_all
    Like.destroy_all

    @user = User.create(name: 'gaby', email: 'gaby@gmail.com', password: 'password', confirmed_at: Time.now)

    @post = Post.create(
      user: @user,
      title: 'My first post',
      text: 'This is the first post of gaby',
      commentsCounter: 0,
      likesCounter: 0
    )

    @like = Like.create(user: @user, post: @post)
  end

  context '#user' do
    it 'should be present' do
      @like.user = nil
      expect(@like).to_not be_valid
    end
  end

  context '#post' do
    it 'should be present' do
      @like.post = nil
      expect(@like).to_not be_valid
    end
  end

  context '#uniqueness' do
    it 'A given user and a post must be added to likes table only once' do
      Like.create(user: @user, post: @post)
      second_record = Like.create(user: @user, post: @post)
      expect(second_record.errors.full_messages).to include('User has already been taken')
    end
  end

  describe '#method' do
    before :all do
      @user_a = User.create(name: 'any', email: 'any@gmail.com', password: 'password', confirmed_at: Time.now)
      @user_b = User.create(name: 'sara', email: 'sara@gmail.com', password: 'password', confirmed_at: Time.now)
      @post_b = Post.create(user: @user_a, title: 'post A', text: 'text A', commentsCounter: 0, likesCounter: 0)
      Like.create(user: @user_a, post: @post_b)
      @like_b = Like.create(user: @user_b, post: @post_b)
    end

    context '#increment_likes_counter' do
      it 'should incremment the Post&apos;s likesCounter attribute to from 0 to 2' do
        expect(@post_b.likesCounter).to eq 2
      end
    end

    context '#decrement_likes_counter' do
      it 'should decrement the Post&apos;s likesCounter attribute to from 2 to 1' do
        @like_b.destroy
        expect(@post_b.likesCounter).to eq 1
      end
    end
  end
end
