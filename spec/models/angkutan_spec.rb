require 'rails_helper'

RSpec.describe Angkutan, type: :model do
  # Association tests
  # ensure Angkutan model has a 1:m relationship with the Lewat model
  it { should have_many(:lewats).dependent(:destroy) }
  # ensure Angkutan model has a m:m relationship with the Road model through Lewat model
  it { should have_many(:roads).through(:lewats) }
  # ensure Lewat model has a m:1 relationships with the TipeAngkutan model
  it { should belong_to(:tipe_angkutan) }

  # Validation tests
  # ensure columns (plat_nomor, rute_awal, rute_akhir) are present before saving
  it { should validate_presence_of(:plat_nomor) }
  it { should validate_presence_of(:rute_awal) }
  it { should validate_presence_of(:jalur) }
  it { should validate_presence_of(:rute_akhir) }
end
