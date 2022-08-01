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
      
      # validate params[:username] and assign the value to the username variable
      if params[:username] && User.find_by_username(params[:username])
        username = User.find_by_username(params[:username]).username
      elsif current_user.username != params[:username]
        pp "################ invalid username ####################"
        return render json: {error: "The page you’re looking for doesn’t exist."}
        
      elsif current_user.username
        username = current_user.username
      else
        pp "################ invalid username ####################"
        return render json: {error: "The page you’re looking for doesn’t exist."}
        
      end

      # username = if params[:username]
      #               User.find_by_username(params[:username]).username
      #             elsif current_user.username
      #               current_user.username
      #             end
      
      linkList = Link.find_by_user(username)

      # returned user who has links
      if linkList.length > 0
        linkList.map { |link|
          @dashboard[:links] << {id: link.id, title: link.title, link_address: link.link_address, user_id: link.user_id}
        }

      # new user || user who doesn't have any links
      else
        pp "*** this user doesn't have any links ****"
        
        @dashboard[:links] = []
        # @dashboard[:links] = {message: "No data available"}
      end

      # returned user who has appearnace
      if Appearance.find_by_user_id(username).last
        @dashboard[:appearance] = Appearance.find_by_user_id(username).last        
        @dashboard[:appearance] = AppearanceSerializer.new(@dashboard[:appearance]).serializable_hash[:data][:attributes]
      
      # new user || user who doesn't have any appearnace setting
      else
        pp "*** this user doesn't have any appearance ****"
        @dashboard[:appearance] = {}
        # @dashboard[:appearance] = {message: "No data available"}
      end

      render json: @dashboard  
    else
      render json: {error: "The page you’re looking for doesn’t exist."}
    end
  end
  
  private

  def dashboard_params
    params.require(:dashbaord).permit(:username)
  end
end
