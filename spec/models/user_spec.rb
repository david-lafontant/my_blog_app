require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    User.destroy_all

    @user = User.create(name: 'gaby', email: 'gaby@gmail.com', password: 'password', confirmed_at: Time.now)
  end

  context '#name' do
    it 'should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end

  context '#photo' do
    it 'should be present' do
      @user.photo = nil
      expect(@user).to_not be_valid
    end
  end

  context '#bio' do
    it 'should be present' do
      @user.bio = nil
      expect(@user).to_not be_valid
    end
  end

  context '#postsCounter' do
    it 'should be present' do
      @user.postsCounter = nil
      expect(@user).to_not be_valid
    end

    it 'should be greater than or equal to zero' do
      @user.postsCounter = -1
      expect(@user).to_not be_valid
    end
  end

  describe '#method' do
    before :all do
      Post.create(user: @user, title: 'post A', text: 'text A', commentsCounter: 0, likesCounter: 0)
      Post.create(user: @user, title: 'post B', text: 'text B', commentsCounter: 0, likesCounter: 0)
      Post.create(user: @user, title: 'post C', text: 'text C', commentsCounter: 0, likesCounter: 0)
      Post.create(user: @user, title: 'post D', text: 'text D', commentsCounter: 0, likesCounter: 0)
      Post.create(user: @user, title: 'post E', text: 'text E', commentsCounter: 0, likesCounter: 0)
    end

    context '#most_recent_posts' do
      it 'should get the 3 most recent posts' do
        expect(@user.most_recent_posts.length).to eq 3
      end

      it 'should get the last post as the first result' do
        expect(@user.most_recent_posts.first.title).to eq 'post E'
      end

      it 'should get the third post as the last result' do
        expect(@user.most_recent_posts.last.title).to eq 'post C'
      end
    end

    context '#posts_desc_order' do
      it 'should get the all user post in descendent order' do
        expect(@user.posts_desc_order[0].title).to eq 'post E'
      end
    end
  end
end
