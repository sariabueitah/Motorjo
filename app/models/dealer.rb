class Dealer < ActiveRecord::Base
	has_one :user, as: :meta, dependent: :destroy
	validates :gallery_name, :gallery_location, :street_name, :building_number, presence: true
  	accepts_nested_attributes_for :user
end
