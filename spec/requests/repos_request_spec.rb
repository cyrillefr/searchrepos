require 'rails_helper'

RSpec.describe "Repos", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/repos/index"
      expect(response).to have_http_status(:success)
    end
  end

end
