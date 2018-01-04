class Lewat < ApplicationRecord
  # Model Associations
  belongs_to :angkutan
  belongs_to :road

  # Validation
  validates :pulang,  :inclusion => { :in => [true, false] }   
  validates_presence_of :urutan
end
