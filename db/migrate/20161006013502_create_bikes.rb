class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :serial_number
      t.string :brand
      t.string :model
      t.string :place_of_purchase

      t.timestamps
    end
  end
end
