# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   before(:each) do
#     @user_test = User.create(name: 'Gaby user', photo: 'url/photo', bio: 'Gaby biography', postsCounter: 0)
#     @post_test = Post.create(
#       user: @user_test,
#       title: 'Gaby first post',
#       text: 'This is the Gaby first post content',
#       commentsCounter: 0,
#       likesCounter: 0,
#       user_id: 1
#     )
#   end

#   describe 'GET#index' do
#     before { get user_posts_path(@user_test.id) }

#     it 'is a success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'renders index template' do
#       expect(response).to render_template(:index)
#     end

#     it 'includes the posts list' do
#       expect(response.body).to include('Gaby first post')
#     end
#   end

#   describe 'GET#show' do
#     before { get user_post_path(@user_test.id, @post_test.id) }

#     it 'is a success' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'renders show template' do
#       expect(response).to render_template(:show)
#     end

#     it 'includes the posts detail info' do
#       expect(response.body).to include('Gaby first post')
#     end
#   end
# end
