class CarImage < ActiveRecord::Base
	belongs_to :car 
	has_attached_file :image, :styles => {:medium => "600x600>", :small => "200x200>", :thumb => "100x100>" }, :reject_if => lambda { |t| t['attachment'].nil? }
	validates_attachment :image, :presence => true, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :in => 0..5.megabytes }
end
