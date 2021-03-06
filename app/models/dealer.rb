class Dealer < ActiveRecord::Base
	has_one :user, as: :meta, dependent: :destroy
	validates :gallery_name, :gallery_location, :street_name, :building_number, presence: true
  	accepts_nested_attributes_for :user
  	City = {
		"1" => "Amman",
		"2" => "Zarqa",
		"3" => "Irbid",
		"4" => "Aqaba",
		"5" => "as-Salt",
		"6" => "Ar Ramtha",
		"7" => "Madaba",
		"8" => "Mafraq",
		"9" => "Jerash",
		"10" => "Ma'an",
		"11" => "Tafilah",
		"12" => "Karak",
		"13" => "Ajloun"
	}
end
