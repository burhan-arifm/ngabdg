class AddColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :lewats, :urutan, :integer
  end
end
