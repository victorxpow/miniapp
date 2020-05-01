require 'rails_helper'

RSpec.describe 'Lists', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      user = create(:user)
      login_as(user, scope: :user)
      get '/lists'
      expect(response).to have_http_status(:success)
    end
  end
end
