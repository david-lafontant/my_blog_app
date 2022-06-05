require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before :all do
    User.destroy_all
    Post.destroy_all
    @user = User.create(name: 'Gaby', email: 'gaby@gmail.com', bio: "This is Gaby's bio", password: 'password',
                        role: 'admin', confirmed_at: Time.now)
    @user_b = User.create(name: 'Sara', email: 'sara@gmail.com', password: 'password', role: 'default',
                          confirmed_at: Time.now)
    @user_c = User.create(name: 'Any', email: 'any@gmail.com', password: 'password', role: 'default',
                          confirmed_at: Time.now)

    Post.create(user: @user, title: 'post A Gaby', text: 'text A', commentsCounter: 0, likesCounter: 0)
    Post.create(user: @user, title: 'post B Gaby', text: 'text B', commentsCounter: 0, likesCounter: 0)
    Post.create(user: @user, title: 'post C Gaby', text: 'text C', commentsCounter: 0, likesCounter: 0)
    Post.create(user: @user, title: 'post D Gaby', text: 'text D', commentsCounter: 0, likesCounter: 0)
    @post = Post.create(user: @user, title: 'post E Gaby', text: 'text E', commentsCounter: 0, likesCounter: 0)

    Comment.create(user: @user_b, post: @post, text: 'comment A')
    Comment.create(user: @user_b, post: @post, text: 'comment B')
    Comment.create(user: @user_b, post: @post, text: 'comment C')
    Comment.create(user: @user_b, post: @post, text: 'comment D')
    Comment.create(user: @user_c, post: @post, text: 'comment E')
    Comment.create(user: @user_c, post: @post, text: 'comment F')
    Comment.create(user: @user_c, post: @post, text: 'comment G')

    Like.create(user: @user, post: @post)
    Like.create(user: @user_b, post: @post)
    Like.create(user: @user_c, post: @post)
  end

  before :each do
    visit new_user_session_path
    fill_in 'user[email]', with: 'gaby@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'

    visit user_path @user.id
    visit user_posts_path @user.id
    visit user_post_path @user.id, @post.id
  end

  context '#Get' do
    it "should display the post's title" do
      expect(page).to have_text('post E Gaby')
    end

    it 'should display whote the post' do
      expect(page).to have_text('by Gaby')
    end

    it "shoul display the post's number of comments" do
      comments_button = find_button("comments_post-#{@post.id}")
      expect(comments_button.text).to eq 'Comments: 7'
    end

    it "shoul display the post's number of likes" do
      likes_button = find_button("likes_post-#{@post.id}")
      expect(likes_button.text).to eq 'Unlike: 3'
    end

    it "should display the post's body" do
      expect(page).to have_text('text E')
    end

    it "should display the post's commentors' names" do
      sara_posts = page.all('h4', text: 'Sara:')
      any_posts = page.all('h4', text: 'Any:')
      expect(sara_posts.count).to eq 4
      expect(any_posts.count).to eq 3
    end

    it "should display the pos's commentors' comments" do
      expect(page).to have_text 'comment A'
      expect(page).to have_text 'comment B'
      expect(page).to have_text 'comment C'
      expect(page).to have_text 'comment D'
      expect(page).to have_text 'comment E'
      expect(page).to have_text 'comment F'
      expect(page).to have_text 'comment G'
    end
  end
end
