require 'rails_helper'

RSpec.describe "PrefectureIds", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/prefecture_id/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/prefecture_id/new"
      expect(response).to have_http_status(:success)
    end
  end

end
