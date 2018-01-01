class Lewat < ApplicationRecord
  # Model Associations
  belongs_to :angkutan
  belongs_to :road

  # Validation
  validates_presence_of :pulang
  validates_presence_of :urutan
end
