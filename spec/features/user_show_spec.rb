require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before :all do
    User.destroy_all
    Post.destroy_all
    @user = User.create(name: 'Gaby', email: 'gaby@gmail.com', bio: "This is Gaby's bio", password: 'password',
                        role: 'admin', confirmed_at: Time.now)

    Post.create(user: @user, title: 'post A Gaby', text: 'text A', commentsCounter: 0, likesCounter: 0)
    Post.create(user: @user, title: 'post B Gaby', text: 'text B', commentsCounter: 0, likesCounter: 0)
    Post.create(user: @user, title: 'post C Gaby', text: 'text C', commentsCounter: 0, likesCounter: 0)
    Post.create(user: @user, title: 'post D Gaby', text: 'text D', commentsCounter: 0, likesCounter: 0)
    @post = Post.create(user: @user, title: 'post E Gaby', text: 'text E', commentsCounter: 0, likesCounter: 0)
  end

  before :each do
    visit new_user_session_path
    fill_in 'user[email]', with: 'gaby@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'

    visit user_path @user
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

    it 'should display the bio of the user' do
      expect(page).to have_text("This is Gaby's bio")
    end

    it "should display the user's first 3 posts" do
      user_posts = page.all('div', class: 'card__box-post')
      expect(user_posts.count).to eq 3
      expect(page).to have_text 'post E Gaby'
      expect(page).to have_text 'post D Gaby'
      expect(page).to have_text 'post C Gaby'
    end

    it "should display the button that lets me view all of a user's posts" do
      see_all_link = find_link(href: user_posts_path(@user.id))
      expect(see_all_link).to_not be_nil
      expect(page).to have_text 'See all posts'
    end
  end

  context '#Post' do
    it "should redirect to post's show page by clicking on a given post" do
      click_link(id: "link_post-#{@post.id}")
      expect(current_path).to eq(user_post_path(user_id: @user.id, id: @post.id))
    end

    it "should redirect to the user's posts index page by clicking on button See all posts" do
      click_link(href: user_posts_path(@user.id))
      expect(current_path).to eq(user_posts_path(@user.id))
    end
  end
end
