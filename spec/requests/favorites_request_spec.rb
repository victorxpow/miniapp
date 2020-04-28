require 'rails_helper'

RSpec.describe "Favorites", type: :request do

  describe "GET /update" do
    it "returns http success" do
      get "/favorites/update"
      expect(response).to have_http_status(:success)
    end
  end

end
