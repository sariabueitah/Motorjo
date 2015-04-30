class AddInteriorDesignIdToCar < ActiveRecord::Migration
  def change
    add_column :cars, :interior_design_id, :integer
  end
end
