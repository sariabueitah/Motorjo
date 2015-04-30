class ComfortInterior < ActiveRecord::Base
  has_many :car_comfort_interiors
  has_many :cars, through: :car_comfort_interiors
end
