class AppearancesController < ApplicationController
  before_action :set_appearance, only: [:show, :update, :destroy]

  # GET /appearances/1  
  def show
    # @appearance = Appearance.last.to_json(include: [:picture_url])
    @appearance = Appearance.where(user_id: params[:user_id])
    
    pp "**** show ****"
    pp url_for(@appearance.picture)
    pp @appearance.picture
        
    render json: AppearanceSerializer.new(@appearance).serializable_hash[:data][:attributes]
  end
  
  # POST /appearances
  def create
    @appearance = Appearance.new(appearance_params)
    
    pp "****** @appearance created *********"
    pp @appearance.picture.blob
    
    if @appearance.save
      # render json: @appearance, status: :created
      render json: AppearanceSerializer.new(@appearance).serializable_hash[:data][:attributes], status: :created
    else
      render json: @appearance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appearances/1
  def update
    if @appearance.update(appearance_params)
      render json: @appearance
    else
      render json: @appearance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appearances/1
  def destroy
    @appearance.destroy
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_appearance
      @appearance = Appearance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appearance_params
      params.require(:appearance).permit(:user_id, :profile_title, :bio, :bg_color, :bg_image_url, :picture)
    end
end
