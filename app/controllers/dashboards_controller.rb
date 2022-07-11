class DashboardsController < ApplicationController
  # GET /dashboard
  def index
    @links = []

    if Link.count !== 0
      Link.all.map { |link|
        @links << {link_id: link.id, title: link.title, link_address: link.link_address}
      }
      render json: @links
    else
      render json: {error: "Unauthorised Access"}
    end
  end
end
