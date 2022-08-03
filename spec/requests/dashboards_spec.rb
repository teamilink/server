require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  
  describe "GET /dashboard" do
    before(:each) do
      @test_user = FactoryBot.create(:user, username: "coder_academy", email: "coder@test.com", password: "test123", password_confirmation: "test123")
    end

    it "returns the data created by the loggedInUser" do
      get '/dashboard', params: {username: @test_user.username}
      expect(response.body).to include("links")
    end

    it "returns the data of the user when the username is entered" do
      get '/dashboard', params: {username: "coder_academy"}
      expect(response.body).to include("links")
    end

    it "doesn't throw error if there is no data available for a new user" do
      FactoryBot.create(:user, username: "new_user", email: "newUser@test.com", password: "test123", password_confirmation: "test123")
      get '/dashboard', params: {username: "new_user"}
      expect(response.body).to include("links")
      expect(response.body).to include("appearance")
    end

  end
end
