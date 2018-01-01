FactoryBot.define do
  factory :road do
    nama { Faker::Address.street_name }
    lat_awal { Faker::Address.latitude }
    long_awal { Faker::Address.longitude }
    lat_akhir { Faker::Address.latitude }
    long_akhir { Faker::Address.longitude }
    searah { Faker::Boolean.boolean }
  end
end
