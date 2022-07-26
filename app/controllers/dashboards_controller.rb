class DashboardsController < ApplicationController
  # before_action :authenticate_user, only: [:index]
  # GET /dashboard
  def index
    # @links = []

    @dashboard = {
      links: [],
      appearance: {}
    }

    pp "********** dashboard - index **********"
    pp current_user
    
    # generate a links json for the current user's dashboard
    if current_user
      Link.where(user_id: current_user.id).map { |link|
        @dashboard[:links] << {id: link.id, title: link.title, link_address: link.link_address, user_id: link.user_id}
      }

      @dashboard[:appearance] = Appearance.where(user_id: current_user.id).last        
      @dashboard[:appearance] = AppearanceSerializer.new(@dashboard[:appearance]).serializable_hash[:data][:attributes]
      pp @dashboard

      render json: @dashboard
    else
      render json: {error: "Unauthorised Access"}
    end
  end
end
