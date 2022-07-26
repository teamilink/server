class DashboardsController < ApplicationController
  
  # GET /dashboard
  def index
    @dashboard = {
      links: [],
      appearance: {}
    }

    pp "********** dashboard - index **********"
    
    # generate a links json for the current user's dashboard
    if current_user
      if Link.where(user_id: current_user.id).length > 0
        Link.where(user_id: current_user.id).map { |link|
          @dashboard[:links] << {id: link.id, title: link.title, link_address: link.link_address, user_id: link.user_id}
        }

        @dashboard[:appearance] = Appearance.where(user_id: current_user.id).last        
        @dashboard[:appearance] = AppearanceSerializer.new(@dashboard[:appearance]).serializable_hash[:data][:attributes]

        render json: @dashboard
      else
        render json: @dashboard
      end
    else
      render json: {error: "Unauthorised Access"}
    end
  end
end
