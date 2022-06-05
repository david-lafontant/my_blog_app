require 'rails_helper'

RSpec.describe 'Sign in process', type: :feature do
  before :all do
    User.destroy_all
    User.create(name: 'Gaby', email: 'user@gmail.com', password: 'password', confirmed_at: Time.now)
  end

  before :each do
    visit new_user_session_path
  end

  context '#GET' do
    it 'should validate if there are username and password inputs and the "Log in" button' do
      email_field = find_field('user[email]')
      password_field = find_field('user[password]')
      submit_button = find_button('Log in')
      expect(email_field).to_not be_nil
      expect(password_field).to_not be_nil
      expect(submit_button).to_not be_nil
    end
  end

  context '#Post' do
    it 'should return "Invalid Email or password." message after submit form with empty email and password fields.' do
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should return "Invalid Email or password." message after submit form with an incorrect email.' do
      fill_in 'user[email]', with: 'wrong.user@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should return "Invalid Email or password." message after submit form with an incorrect password.' do
      fill_in 'user[email]', with: 'user@gmail.com'
      fill_in 'user[password]', with: 'wrong.password'
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'should return "Signed in successfully." message after submit form with the correct email and password.' do
      fill_in 'user[email]', with: 'user@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'Log in'
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Signed in successfully.')
    end
  end
end
