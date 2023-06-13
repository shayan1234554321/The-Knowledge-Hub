require 'rails_helper'

RSpec.describe 'Users' do
  describe 'GET /index' do
    before { get '/users' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'renders the correct content' do
      expect(response.body).to include('users')
    end
  end
  describe 'GET /show' do
    before { get '/users/10' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:show)
    end
    it 'renders the correct content' do
      expect(response.body).to include('user')
    end
  end
end
