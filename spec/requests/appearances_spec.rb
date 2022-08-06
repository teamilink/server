require 'rails_helper'

RSpec.describe "/dashboard/appearance", type: :request do
  before(:all) do
    @test_user = FactoryBot.create(:user, username: "appearance_tester", email: "appearance_tester@email.com", password: "test123", password_confirmation: "test123")
  end
  
  describe "POST /dashboard/appearance" do
  
    it "creates a new Appearance" do
      post "/dashboard/appearance", params: {appearance: {profile_title: "Coder Playground", bio: "Nice to meet you!", user_id: @test_user.id, bg_color: "green", bg_image_url: "", picture: "", picture_url: ""}}
      expect(response).to have_http_status(:created)
    end

    it "does not create a new Appearance if the pamas is missing a required field" do
      post "/dashboard/appearance", params: {appearance: {profile_title: "Coder Playground", bio: "Nice to meet you!", bg_color: "green", bg_image_url: "", picture: ""}}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PUT /dashboard/appearance/:id" do

    before(:each) do
      @test_appearance = FactoryBot.create(:appearance, profile_title: "Coder Academy", bio: "Nice to meet you!", user_id: @test_user.id, bg_color: "light")
    end
    
    it "updates the existing entity with valid params" do
      put "/dashboard/appearance/#{@test_appearance.id}", params: {appearance: {profile_title: "Amazing Coder", bio: "Nice to meet you!", user_id: @test_user.id, bg_color: "green"}}
      expect(response.body).to include("Amazing Coder")
    end

    it "updates only edited fields" do
      put "/dashboard/appearance/#{@test_appearance.id}", params: {appearance: {profile_title: "Happy Coder", user_id: @test_user.id, bg_image_url: "https://abcd.com"}}
      expect(response.body).to include("Happy Coder")
      expect(response.body).to include("Nice to meet you!")
      expect(response.body).to include("https://abcd.com")
    end
    
  end
end
