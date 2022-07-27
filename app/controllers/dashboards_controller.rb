class DashboardsController < ApplicationController
  
  # GET /dashboard
  def index
    @dashboard = {
      links: [],
      appearance: {}
    }

    pp "********** dashboard - index **********"
    
    # if a user is logged in and want to check other's link ? 
    if current_user || params[:username]
      
      username = if params[:username]
                    params[:username]
                  elsif current_user.username
                    current_user.username
                  end
      
      linkList = Link.find_by_user(username)

      if linkList.length > 0
        linkList.map { |link|
          @dashboard[:links] << {id: link.id, title: link.title, link_address: link.link_address, user_id: link.user_id}
        }
      end

      # if current_user
        # if Link.where(user_id: current_user.id).length > 0
        #   Link.where(user_id: current_user.id).map { |link|
        #     @dashboard[:links] << {id: link.id, title: link.title, link_address: link.link_address, user_id: link.user_id}
        #   }
        # end

        @dashboard[:appearance] = Appearance.find_by_user_id(username).last        
        @dashboard[:appearance] = AppearanceSerializer.new(@dashboard[:appearance]).serializable_hash[:data][:attributes]

        render json: @dashboard
        
      else
        render json: {error: "Username not found"}
    end
  end
  
  
  def show
    pp "*************** dashbaord - SHOW ***************"
    if params
      pp params
    end
  end

  private


  def dashboard_params
    params.require(:dashbaord).permit(:username)
  end
end
