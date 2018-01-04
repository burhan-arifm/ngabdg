require 'rails_helper'

RSpec.describe Lewat, type: :model do
  # Association tests
  # ensure Lewat model has a m:1 relationships with Angkutan model and Road model
  it { should belong_to(:angkutan) }
  it { should belong_to(:road) }
  
  # Validation test
  # ensure column pulang are present before saving
  it { should validate_inclusion_of(:pulang).in_array([true, false]) }
  it { should validate_presence_of(:urutan) }
end
