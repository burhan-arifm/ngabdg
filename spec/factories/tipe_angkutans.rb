FactoryBot.define do
  factory :tipe_angkutan do
    tipe { Faker::Vehicle.manufacture }
    ongkos { Faker::Number.between(1, 10) }
    flat { Faker::Boolean.boolean }
  end
end