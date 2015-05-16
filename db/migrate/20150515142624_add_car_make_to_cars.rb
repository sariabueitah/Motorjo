class AddCarMakeToCars < ActiveRecord::Migration
  def change
    add_column :cars, :car_make, :integer
  end
end
