require 'rails_helper'

RSpec.describe TipeAngkutan, type: :model do
  # Association test
  # ensure TipeAngkutan model has a 1:m relationship with the Angkutan model
  it { should have_many(:angkutans).dependent(:destroy) }

  # Validation tests
  # ensure columns (nama, lat_awal, lat_akhir, long_awal, long_akhir, searah) are present before saving
  it { should validate_presence_of(:tipe) }
  it { should validate_presence_of(:ongkos) }
  it { should validate_inclusion_of(:flat).in_array([true, false]) }
end
