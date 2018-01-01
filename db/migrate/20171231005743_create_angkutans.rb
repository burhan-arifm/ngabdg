class CreateAngkutans < ActiveRecord::Migration[5.1]
  def change
    create_table :angkutans do |t|
      t.string :plat_nomor
      t.string :rute_awal
      t.string :jalur
      t.string :rute_akhir
      t.references :tipe_angkutan, foreign_key: true

      t.timestamps
    end
  end
end
