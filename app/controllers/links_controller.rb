class LinksController < ApplicationController
  before_action :set_link, only: [:show, :update, :destroy]

  # # GET /links/1
  # def show
  #   if @link
  #     render json: @link, status: :success
  #   else
  #     render json: {error: "Link not found, wrong id"}, status: :not_found
  #   end
  # end

  # POST /links
  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link, status: :created
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:title, :link_address)
    end
end
