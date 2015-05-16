class AddCarModelToCars < ActiveRecord::Migration
  def change
    add_column :cars, :car_model, :integer
  end
end
