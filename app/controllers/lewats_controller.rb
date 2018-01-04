class LewatsController < ApplicationController
  before_action :set_lewat, only: [:show, :update, :destroy]

  # GET /lewats
  def index
    @lewats = Lewat.all
    json_response(@lewats)
  end

  # POST /lewats
  def create
    @lewat = Lewat.create!(lewat_params)
    json_response(@lewat, :created)
  end

  # GET /lewats/:id
  def show
    json_response(@lewat)    
  end

  # PUT /lewats/:id
  def update
    @lewat.update(lewat_params)
    head :no_content
  end

  # DELETE /lewats/:id
  def destroy
    @lewat.destroy
    head :no_content
  end

  private

  def lewat_params
    # whitelist parameters
    params.permit(:angkutan_id, :pulang, :road_id, :urutan)
  end

  def set_lewat
    @lewat = Lewat.find(params[:id])
  end
end
