class AddSpecialCarToCars < ActiveRecord::Migration
  def change
    add_column :cars, :special_car, :bool
  end
end
