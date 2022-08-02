class DashboardsController < ApplicationController
  
  # GET /dashboard
  def index
    @dashboard = {
      links: [],
      appearance: {}
    }

    pp "********** dashboard - index **********"
    
    # 1. current_user | signing in
    # 2. params[:username] | visiting a profile
    # 2-1. params[:username] does exist | the profile exist
    # 2-2. params[:username] doesn't exist | the profile doesn't exist
    # 3. current_user -> different params[:username] | a logged in user visit different profile
    # 3-1. params[:username] does exist | the profile exist
    # 3-2. params[:username] doesn't exist | the profile doesn't exist
    # 4. current_user -> same params[:username] | a logged in user visit their profile
    
    if current_user && params[:username]
      pp "################ current & params exist ####################"
      pp params[:username]
      
      # 3 
      if current_user.username != params[:username]
        pp "################ current != params exist 3 ####################"
        # 3-1
        if params[:username] && User.find_by_username(params[:username])
          pp "################ valid username 3-1 ####################"
          username = User.find_by_username(params[:username]).username
        # 3-2
        else
          pp "################ invalid username 3-2 ####################"
          return render json: {error: "The page you’re looking for doesn’t exist."}
        end
        # 4
      else
        pp "################ current_user's username 4 ####################"
        username = current_user.username
      end
      # 2
    elsif params[:username]
      pp "################ params exist 2 ####################"
      # 2-1
      if params[:username] && User.find_by_username(params[:username])
        pp "################ valid username 2-1  ####################"
        username = User.find_by_username(params[:username]).username
      # 2-2
      else
        pp "################ invalid username 2-2 ####################"
        return render json: {error: "The page you’re looking for doesn’t exist."}
      end
    # 1
    elsif current_user
      pp "################ current_user's username 1 ####################"
      username = current_user.username
    else
      pp "################ invalid username - else ####################"
      return render json: {error: "The page you’re looking for doesn’t exist."}
    end
    
      
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
    end

    # returned user who has appearnace
    if Appearance.find_by_user_id(username).last
      @dashboard[:appearance] = Appearance.find_by_user_id(username).last        
      @dashboard[:appearance] = AppearanceSerializer.new(@dashboard[:appearance]).serializable_hash[:data][:attributes]
    
    # new user || user who doesn't have any appearnace setting
    else
      pp "*** this user doesn't have any appearance ****"
      @dashboard[:appearance] = {}
    end

    render json: @dashboard  
    
  end
  
  private

  def dashboard_params
    params.require(:dashbaord).permit(:username)
  end
end
