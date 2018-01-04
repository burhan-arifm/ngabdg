FactoryBot.define do
  factory :lewat do
    angkutan_id nil
    pulang { Faker::Boolean.boolean }
    road_id nil
    urutan { Faker::Number.between(1, 25) }
  end
end