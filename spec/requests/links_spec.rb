require 'rails_helper'

RSpec.describe "/links", type: :request do

  before(:all) do
    @test_user = FactoryBot.create(:user, username: "link_tester", email: "link_tester@email.com", password: "test123", password_confirmation: "test123")
    FactoryBot.create(:link, title: "test title 1", link_address: "https://test_link", user_id: @test_user.id)
    FactoryBot.create(:link, title: "test title 2", link_address: "https://test_link", user_id: @test_user.id)
  end

  describe "POST /links" do
    it "creates a new Link" do
      post "/links", params: {link: {title: "post test", link_address: "https://test", user_id: @test_user.id}}
      expect(response).to have_http_status(:created)
    end
    
    it "renders an warning message if the pamas contains invalid data" do
      post "/links", params: {link: {title: "post test", address: "https://test", user_id: 1}}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  
  describe "PATCH /links/:id" do
    it "updates the data based on the params" do
      put "/links/1", params: {link: {title: "update test"}}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested link" do
      delete "/links/1"
      expect(response).to have_http_status(:no_content)
    end
  end
end
