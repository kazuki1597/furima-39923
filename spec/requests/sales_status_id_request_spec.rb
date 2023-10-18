require 'rails_helper'

RSpec.describe "SalesStatusIds", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/sales_status_id/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/sales_status_id/new"
      expect(response).to have_http_status(:success)
    end
  end

end
