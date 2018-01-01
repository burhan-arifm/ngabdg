class AlterColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :tipe_angkutans, :flat, :boolean, :default => false
    change_column :roads, :searah, :boolean, :default => false
  end
end
