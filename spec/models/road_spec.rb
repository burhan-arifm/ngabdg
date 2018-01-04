require 'rails_helper'

RSpec.describe Road, type: :model do
  # Association tests
  # ensure Road model has a 1:m relationship with the Lewat model
  it { should have_many(:lewats).dependent(:destroy) }
  # ensure Road model has a m:m relationship with the Angkutan model through Lewat model
  it { should have_many(:angkutans).through(:lewats) }

  # Validation tests
  # ensure columns (nama, lat_awal, lat_akhir, long_awal, long_akhir, searah) are present before saving
  it { should validate_presence_of(:nama) }
  it { should validate_presence_of(:lat_awal) }
  it { should validate_presence_of(:long_awal) }
  it { should validate_presence_of(:lat_akhir) }
  it { should validate_presence_of(:long_akhir) }
  it { should validate_inclusion_of(:searah).in_array([true, false]) }
end
