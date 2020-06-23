require 'rails_helper'

RSpec.describe "SpotComments", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/spot_comments/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/spot_comments/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/spot_comments/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/spot_comments/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/spot_comments/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
