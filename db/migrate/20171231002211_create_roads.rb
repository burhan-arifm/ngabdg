class CreateRoads < ActiveRecord::Migration[5.1]
  def change
    create_table :roads do |t|
      t.string :nama
      t.float :lat_awal
      t.float :long_awal
      t.float :lat_akhir
      t.float :long_akhir
      t.boolean :searah

      t.timestamps
    end
  end
end
