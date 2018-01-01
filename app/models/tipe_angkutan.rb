class TipeAngkutan < ApplicationRecord
  # Model Association
  has_many :angkutans, dependent: :destroy

  # Validations
  validates_presence_of :tipe, :ongkos, :flat
end
