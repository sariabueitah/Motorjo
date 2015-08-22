class AddFuelTypeToCars < ActiveRecord::Migration
  def change
    add_column :cars, :fuel_type, :integer
    add_column :cars, :cubic_capacity, :integer
  end
end
