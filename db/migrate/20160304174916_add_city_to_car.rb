class AddCityToCar < ActiveRecord::Migration
  def change
    add_column :cars, :city, :integer
  end
end
