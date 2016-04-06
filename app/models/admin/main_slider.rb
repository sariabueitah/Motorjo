class Admin::MainSlider < ActiveRecord::Base
  mount_uploader :image, MiscImagesUploader
	validates :image,:order,:title,:description, :presence => true
  Position = {"1" => "right", "2" => "left"}
  Direction = {"1" => "right", "2" => "left","3" => "top","4" => "down"}
  Color = {"1" => "Black", "2" => "White"}
end
