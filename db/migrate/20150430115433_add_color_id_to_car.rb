class AddColorIdToCar < ActiveRecord::Migration
  def change
    add_column :cars, :color_id, :integer
  end
end
