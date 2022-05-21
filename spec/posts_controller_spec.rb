# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   context 'GET /index' do
#     before(:example) { get '/users/:user_id/posts' }

#     it 'Check if response status is correct' do
#       expect(response).to have_http_status(200)
#       expect(response).to have_http_status(:ok)
#     end

#     it 'Check if the correct template is rendered' do
#       expect(response).to render_template(:post_list)
#     end

#     it 'Check if the response body includes the correct placeholder text' do
#       expect(response.body).to include('Posts#list')
#     end
#   end

#   context 'GET /show' do
#     before(:example) { get '/users/:user_id/posts/:id' }

#     it 'Check if response status is correct' do
#       expect(response).to have_http_status(:ok)
#       expect(response).to have_http_status(200)
#     end

#     it 'Check if the correct template is rendered' do
#       expect(response).to render_template(:post_details)
#     end

#     it 'Check if the response body includes the correct placeholder text' do
#       expect(response.body).to include('Posts#details')
#     end
#   end
# end
