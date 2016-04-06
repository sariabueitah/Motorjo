class AddImageToMainSlider < ActiveRecord::Migration
  def change
    add_column :admin_main_sliders, :image, :string
  end
end
