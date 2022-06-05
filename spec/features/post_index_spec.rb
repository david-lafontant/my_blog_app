require 'rails_helper'

RSpec.describe "User's post index", type: :feature do
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
  end

  context '#Get' do
    it 'should display the profile picture of the user' do
      photos = page.all('img')
      expect(photos.count).to eq(1)
    end

    it 'should display the username of the user' do
      expect(page).to have_text('Gaby')
    end

    it 'should display the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 5')
    end

    it 'should display the posts titles' do
      expect(page).to have_text('post A Gaby')
      expect(page).to have_text('post B Gaby')
      expect(page).to have_text('post C Gaby')
      expect(page).to have_text('post D Gaby')
      expect(page).to have_text('post E Gaby')
    end

    it 'should display some of the posts bodies' do
      expect(page).to have_text('text A')
      expect(page).to have_text('text B')
      expect(page).to have_text('text C')
      expect(page).to have_text('text D')
      expect(page).to have_text('text E')
    end

    it "should display all the user's posts" do
      user_posts = page.all('div', class: 'card__box-post')
      expect(page).to have_text 'post E Gaby'
      expect(page).to have_text 'post D Gaby'
      expect(page).to have_text 'post C Gaby'
      expect(page).to have_text 'post D Gaby'
      expect(page).to have_text 'post A Gaby'
      expect(user_posts.count).to eq 5
    end

    it 'should display the first comment for a given post' do
      expect(page).to have_text 'comment A'
    end

    it 'should display the last 5 comments for a given post' do
      post_comments = page.all('.card__box-comments .card__box-comment')
      expect(post_comments.count).to eq 5
    end

    it 'shoul display the number of likes a given post have' do
      likes_button = find_button("likes_post-#{@post.id}")
      expect(likes_button.text).to eq 'Unlike: 3'
    end
  end

  context '#Post' do
    it "should redirect to post's show page by clicking on a given post" do
      click_link(id: "link_post-#{@post.id}")
      expect(current_path).to eq(user_post_path(user_id: @user.id, id: @post.id))
    end
  end
end
