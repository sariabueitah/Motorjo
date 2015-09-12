class AddImageToCarImages < ActiveRecord::Migration
  def change
    add_column :car_images, :image, :string
  end
end
