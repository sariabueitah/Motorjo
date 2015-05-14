class AddGearboxIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :gearbox_id, :integer
  end
end
