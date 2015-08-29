class CarImage < ActiveRecord::Base
	belongs_to :car 
	has_attached_file :image,
		:styles => {:thumb => "109x78", :homepage_carousel => "230x162", :search => "213x150", :special_car => "287x133", :special_car_main => "470x286", :car_main => "470x338", :search_special => "137x99"}, 
		:convert_options => {
			:thumb => '-background rgb\(202,205,208\) -gravity center -extent 109x78!', 
			:homepage_carousel => '-background rgb\(202,205,208\) -gravity center -extent 230x162!', 
			:search => '-background rgb\(202,205,208\) -gravity center -extent 213x150!',
			:special_car => '-background rgb\(202,205,208\) -gravity center -extent 287x133!', 
			:special_car_main => '-background rgb\(202,205,208\) -gravity center -extent 470x286!', 
			:car_main => '-background rgb\(202,205,208\) -gravity center -extent 470x338!',
			:search_special => '-background rgb\(202,205,208\) -gravity center -extent 137x99!'}, 
		:reject_if => lambda { |t| t['attachment'].nil? }
	validates_attachment :image, :presence => true, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :in => 0..5.megabytes }
end
