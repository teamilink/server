require 'rails_helper'

RSpec.describe "/links", type: :request do

  before(:all) do
    @test_user = FactoryBot.create(:user, username: "link_tester", email: "link_tester@email.com", password: "test123", password_confirmation: "test123")
    FactoryBot.create(:link, title: "test title 1", link_address: "https://test-link.com", user_id: @test_user.id)
    FactoryBot.create(:link, title: "test title 2", link_address: "https://test-link.com", user_id: @test_user.id)
  end

  describe "POST /links" do
    it "creates a new Link" do
      post "/links", params: {link: {title: "post test", link_address: "https://test.com", user_id: @test_user.id}}
      expect(response).to have_http_status(:created)
    end
    
    it "does not create a new link if there is invalid attributes" do
      post "/links", params: {link: {title: "post test", address: "https://test.com", user_id: 1}}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "does not create a new link if the format of the link address is invalid" do
      post "/links", params: {link: {title: "post test", link_address: "https:/test.com", user_id: 1}}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "does not create a new link if the input title has more than 100 characters" do
      post "/links", params: {link: {title: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean ma", link_address: "https:/test.com", user_id: 1}}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  
  describe "PUT /links/:id" do
    it "updates the data based on the params" do
      put "/links/1", params: {link: {title: "update test"}}
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /links/:id" do
    it "destroys the requested link" do
      delete "/links/1"
      expect(response).to have_http_status(:no_content)
    end
  end
end
