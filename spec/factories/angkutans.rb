FactoryBot.define do
  factory :angkutan do
    plat_nomor { Faker::Vehicle.vin }
    rute_awal { Faker::Address.city }
    jalur { Faker::Address.city }
    rute_akhir { Faker::Address.city }
    tipe_angkutan_id nil
  end
end