class AppearancesController < ApplicationController
  before_action :set_appearance, only: [:show, :update, :destroy]
  
  # POST /appearance
  def create
    @appearance = Appearance.new(appearance_params)
    
    if @appearance.save
      render json: AppearanceSerializer.new(@appearance).serializable_hash[:data][:attributes], status: :created
    else
      render json: @appearance.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appearance/1
  def update

    pp "***************************************************"
    pp appearance_params
    pp "***************************************************"

    # 1. picture is uploaded
    # 1-1. then random image is added
    # 1-2. then picture is uploaded
    # 2. random image is added
    # 2-1. then a picture is uploaded
    # 2-2. then random image is added

    # if picture was attached, and a new bg_image is added
    # remove the existing picture
    # if @appearance.picture && appearance_params[:bg_image_url]
    #   pp "********************** if *****************************"
    #   @appearance.picture.destroy
    #   @appearance.update(appearance_params)
    #   render json: @appearance
    # elsif @appearance.bg_image_url && appearance_params[:picture]
    #   pp "*********************** elsif ****************************"
    #   @appearance.bg_image_url = nil
    #   @appearance.save
    #   @appearance.update(appearance_params)
    #   render json: @appearance
    # else
    #   pp "*********************** else ****************************"
      if @appearance.update(appearance_params)
        render json: @appearance
      else
        render json: @appearance.errors.full_messages, status: :unprocessable_entity
      end
    # end
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
      params.require(:appearance).permit(:user_id, :profile_title, :bio, :bg_color, :bg_image_url, :picture, :picture_url, :img_timestamp, :pic_timestamp, :id).select {|x, v| v.present?}
    end
end
