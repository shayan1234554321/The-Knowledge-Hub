require 'rails_helper'

RSpec.describe 'Users' do
  describe 'GET /index' do
    before { get '/users/10/posts' }
    it 'returns http success' do
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'renders the correct content' do
      expect(response.body).to include('post')
    end
  end
  describe 'GET /show' do
    before { get '/users/10/posts/1' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:show)
    end
    it 'renders the correct content' do
      expect(response.body).to include('post')
    end
  end
end
