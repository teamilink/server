class DashboardsController < ApplicationController
  # GET /dashboard
  def index
    @links = []

    # generate a links json for the current user's dashboard
    if current_user
      Link.where(user_id: current_user.id).map { |link|
        @links << {link_id: link.id, title: link.title, link_address: link.link_address}
      }
      render json: @links
    else
      render json: {error: "Unauthorised Access"}
    end
  end
end
