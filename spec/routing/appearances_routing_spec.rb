require "rails_helper"

RSpec.describe AppearancesController, type: :routing do
  describe "routing" do
    
    it "routes to #create" do
      expect(post: "/dashboard/appearance").to route_to("appearances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dashboard/appearance/1").to route_to("appearances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dashboard/appearance/1").to route_to("appearances#destroy", id: "1")
    end
  end
end
