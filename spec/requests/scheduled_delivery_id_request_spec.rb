require 'rails_helper'

RSpec.describe "ScheduledDeliveryIds", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/scheduled_delivery_id/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/scheduled_delivery_id/new"
      expect(response).to have_http_status(:success)
    end
  end

end
