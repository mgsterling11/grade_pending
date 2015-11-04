class CuisineTypesController < ApplicationController
  before_action :set_cuisine_type, only: [:show, :edit, :update, :destroy]

  # GET /cuisine_types
  # GET /cuisine_types.json
  def index
    @cuisine_types = CuisineType.all
  end

  # GET /cuisine_types/1
  # GET /cuisine_types/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuisine_type
      @cuisine_type = CuisineType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuisine_type_params
      params.require(:cuisine_type).permit(:cuisine_description, :restaurant_id)
    end
end
