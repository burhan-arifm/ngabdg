class Road < ApplicationRecord
  # Model Associations
  has_many :lewats, dependent: :destroy
  has_many :angkutans, through: :lewats

  # Validations
  validates_presence_of :nama, :lat_awal, :long_awal, :lat_akhir, :long_akhir
  validates :searah,  :inclusion => { :in => [true, false] }
end
