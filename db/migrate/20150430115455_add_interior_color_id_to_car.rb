class AddInteriorColorIdToCar < ActiveRecord::Migration
  def change
    add_column :cars, :interior_color_id, :integer
  end
end
