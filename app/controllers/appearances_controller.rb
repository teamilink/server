class AppearancesController < ApplicationController
  before_action :set_appearance, only: [:show, :update, :destroy]
  
  # POST /appearance
  def create
    @appearance = Appearance.new(appearance_params)
    
    pp "****** @appearance created *********"
    
    if @appearance.save
      render json: AppearanceSerializer.new(@appearance).serializable_hash[:data][:attributes], status: :created
    else
      render json: @appearance.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appearance/1
  def update
    if @appearance.update(appearance_params)
      render json: @appearance
    else
      render json: @appearance.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /appearance/1
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
      params.require(:appearance).permit(:user_id, :profile_title, :bio, :bg_color, :bg_image_url, :picture, :picture_url, :id).select {|x, v| v.present?}
    end
end
