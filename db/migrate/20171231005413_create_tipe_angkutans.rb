class CreateTipeAngkutans < ActiveRecord::Migration[5.1]
  def change
    create_table :tipe_angkutans do |t|
      t.string :tipe
      t.integer :ongkos
      t.boolean :flat

      t.timestamps
    end
  end
end
