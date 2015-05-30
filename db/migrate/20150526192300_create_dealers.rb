class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :gallery_name
      t.text :gallery_location
      t.string :street_name
      t.string :building_number

      t.timestamps null: false
    end
  end
end
