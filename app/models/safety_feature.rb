class SafetyFeature < ActiveRecord::Base
  has_many :car_safety_features
  has_many :cars, through: :car_safety_features
  validates :title, presence: true
  translates :title
  def cache_key
	  super + '-' + Globalize.locale.to_s
	end
end
