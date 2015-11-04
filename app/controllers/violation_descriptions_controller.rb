class ViolationDescriptionsController < ApplicationController
  before_action :set_violation_description, only: [:show, :edit, :update, :destroy]

  # GET /violation_descriptions
  # GET /violation_descriptions.json
  def index
    @violation_descriptions = ViolationDescription.all
  end

  # GET /violation_descriptions/1
  # GET /violation_descriptions/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_violation_description
      @violation_description = ViolationDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def violation_description_params
      params.require(:violation_description).permit(:violation_code, :violation_description, :restaurant_id)
    end
end
