class CarImage < ActiveRecord::Base
	belongs_to :car 
	has_attached_file :image, :styles => {:medium => "600x600>", :small => "200x200>", :thumb => "100x100>" }, :reject_if => lambda { |t| t['attachment'].nil? }
	do_not_validate_attachment_file_type :image
end
