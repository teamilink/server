require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "POST /signup" do
    it "creates a new user with the right credentails" do
      post '/signup', params: {username: "coder_academy", email: "coder@test.com", password: "test123", password_confirmation: "test123"}
      expect(response).to have_http_status(:created)
      expect(response.body).to include("coder_academy")
    end

    it "returns error if the username or email are not unique" do
      FactoryBot.create(:user, username: "backend_tester", email: "backend_tester@test.com", password: "test123", password_confirmation: "test123")
      post '/signup', params: {username: "backend_tester", email: "coder@test.com", password: "test123", password_confirmation: "test123"}
      expect(response.body).to include("Oops, your username and email must be unique and the username must not contain any space")
    end
  end

  describe "POST /login" do
    before(:all) do
      @test_user = FactoryBot.create(:user, username: "backend_tester", email: "backend_tester@test.com", password: "test123", password_confirmation: "test123")
    end

    it "logs in the user with the right credentials" do
      post '/login', params: {email: "backend_tester@test.com", password: "test123"}
      expect(response).to have_http_status(200) 
      expect(response.body).to include("backend_tester")
    end 

    it "doesn't log in the user with the wrong password" do
      post '/login', params: {email: "backend_tester@test.com", password: "123"}
      expect(response.body).to include("Invalid email or password")
    end 

    it "doesn't log in the user with the wrong email" do
      post '/login', params: {email: "cd@test.com", password: "test123"}
      expect(response.body).to include("Invalid email or password")
    end 
  end

end
