class CreateCarComfortInteriors < ActiveRecord::Migration
  def change
    create_table :car_comfort_interiors do |t|
      t.integer :car_id
      t.integer :comfort_interior_id

      t.timestamps null: false
    end
  end
end
