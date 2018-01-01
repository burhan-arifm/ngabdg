class TipeAngkutansController < ApplicationController
  before_action :set_ta, only: [:show, :update, :destroy]

  # GET /tipe_angkutans
  def index
    @tipe_angkutans = TipeAngkutan.all
    json_response(@tipe_angkutans)
  end

  # POST /tipe_angkutans
  def create
    @tipe_angkutan = TipeAngkutan.create!(ta_params)
    json_response(@tipe_angkutan, :created)
  end

  # GET /tipe_angkutans/:id
  def show
    json_response(@tipe_angkutan)    
  end

  # PUT /tipe_angkutans/:id
  def update
    @tipe_angkutan.update(ta_params)
    head :no_content
  end

  # DELETE /tipe_angkutans/:id
  def destroy
    @tipe_angkutan.destroy
    head :no_content
  end

  private

  def ta_params
    # whitelist parameters
    params.permit(:tipe, :ongkos, :flat)
  end

  def set_ta
    @tipe_angkutan = TipeAngkutan.find(params[:id])
  end
end
