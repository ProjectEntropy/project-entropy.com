require 'rails_helper'

RSpec.describe CrowdfundDataController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show, metric: :asset
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get :show, metric: :btc
      expect(response).to have_http_status(:success)
    end
  end

end
