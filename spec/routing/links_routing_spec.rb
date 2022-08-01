require "rails_helper"

RSpec.describe LinksController, type: :routing do
  describe "routing" do
    
    it "routes to #create" do
      expect(post: "/links").to route_to("links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/links/1").to route_to("links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/links/1").to route_to("links#destroy", id: "1")
    end
  end
end
