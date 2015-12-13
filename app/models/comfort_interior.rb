class ComfortInterior < ActiveRecord::Base
  has_many :car_comfort_interiors
  has_many :cars, through: :car_comfort_interiors
  validates :title, presence: true
  translates :title
  globalize_accessors :locales => [:en ,:ar], :attributes => [:title]
  def cache_key
	  super + '-' + Globalize.locale.to_s
	end
end
