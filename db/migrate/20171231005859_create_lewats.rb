class CreateLewats < ActiveRecord::Migration[5.1]
  def change
    create_table :lewats do |t|
      t.references :angkutan, foreign_key: true
      t.boolean :pulang
      t.references :road, foreign_key: true

      t.timestamps
    end
  end
end
