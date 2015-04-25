class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :title
      t.text :description
      t.date :year
      t.integer :mileage
      t.decimal :price
      t.text :car_location
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
