class AngkutansController < ApplicationController
  before_action :set_angkutan, only: [:show, :update, :destroy]

  # GET /angkutans
  def index
    @angkutans = Angkutan.all
    json_response(@angkutans)
  end

  # POST /angkutans
  def create
    @angkutan = Angkutan.create!(angkutan_params)
    json_response(@angkutan, :created)
  end

  # GET /angkutans/:id
  def show
    json_response(@angkutan)    
  end

  # PUT /angkutans/:id
  def update
    @angkutan.update(angkutan_params)
    head :no_content
  end

  # DELETE /angkutans/:id
  def destroy
    @angkutan.destroy
    head :no_content
  end

  private

  def angkutan_params
    # whitelist parameters
    params.permit(:plat_nomor, :rute_awal, :jalur, :rute_akhir, :tipe_angkutan_id )
  end

  def set_angkutan
    @angkutan = Angkutan.find(params[:id])
  end
end
