class AddStyleToAdminMainSlider < ActiveRecord::Migration
  def change
    add_column :admin_main_sliders, :position, :integer
    add_column :admin_main_sliders, :color, :integer
    add_column :admin_main_sliders, :title_direction, :integer
    add_column :admin_main_sliders, :description_direction, :integer
  end
end
