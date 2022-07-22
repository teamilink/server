class AppearancesController < ApplicationController
  before_action :set_appearance, only: [:show, :update, :destroy]

  # GET /appearances
  # def index
  #   @appearances = Appearance.all

  #   render json: @appearances
  # end

  # GET /appearances/1
  def show
    render json: @appearance
  end

  # POST /appearances
  def create
    @appearance = Appearance.new(appearance_params)

    if @appearance.save
      render json: @appearance, status: :created
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
      params.require(:appearance).permit(:user_id, :profile_title, :bio, :bg_color, :bg_image_url)
    end
end