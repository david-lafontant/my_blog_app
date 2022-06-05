# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   before :all do
#     User.destroy_all
#     @user = User.create(name: 'gaby', email: 'gaby@gmail.com', password: 'password', confirmed_at: Time.now)
#   end

#   describe 'GET #index' do
#     before { get users_path }

#     it 'is a success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'renders index template' do
#       expect(response).to render_template(:index)
#     end

#     it 'includes the users list' do
#       expect(response.body).to include('Gaby user')
#     end
#   end

#   describe 'GET#show' do
#     before { get user_path(@user.id) }

#     it 'is a success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'renders show template' do
#       expect(response).to render_template(:show)
#     end

#     it 'includes the users detail info' do
#       expect(response.body).to include('Gaby user')
#     end
#   end
# end
