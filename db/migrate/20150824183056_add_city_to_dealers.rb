class AddCityToDealers < ActiveRecord::Migration
  def change
    add_column :dealers, :city, :integer
  end
end
