class Angkutan < ApplicationRecord
  # Model Associations
  has_many :lewats, dependent: :destroy
  has_many :roads, through: :lewats
  belongs_to :tipe_angkutan

  # Validations
  validates_presence_of :plat_nomor, :rute_awal, :jalur, :rute_akhir
end
