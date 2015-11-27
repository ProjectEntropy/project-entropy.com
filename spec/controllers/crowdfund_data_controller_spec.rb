require 'rails_helper'

RSpec.describe CrowdfundDataController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      VCR.use_cassette("/crowdfund_data/asset") do
        get :show, metric: :asset
        expect(response).to have_http_status(:success)
      end
    end

    it "returns http success" do
      VCR.use_cassette("/crowdfund_data/btc") do
        get :show, metric: :btc
        expect(response).to have_http_status(:success)
      end
    end
  end

end
