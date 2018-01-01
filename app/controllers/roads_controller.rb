class RoadsController < ApplicationController
  before_action :set_road, only: [:show, :update, :destroy]

  # GET /roads
  def index
    @roads = Road.all
    json_response(@roads)
  end

  # POST /roads
  def create
    @road = Road.create!(road_params)
    json_response(@road, :created)
  end

  # GET /roads/:id
  def show
    json_response(@road)    
  end

  # PUT /roads/:id
  def update
    @road.update(road_params)
    head :no_content
  end

  # DELETE /roads/:id
  def destroy
    @road.destroy
    head :no_content
  end

  private

  def road_params
    # whitelist parameters
    params.permit(:nama, :lat_awal, :long_awal, :lat_akhir, :long_akhir, :searah)
  end

  def set_road
    @road = Road.find(params[:id])
  end
end
