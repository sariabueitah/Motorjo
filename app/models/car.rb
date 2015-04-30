class Car < ActiveRecord::Base
  has_many :car_safety_features
  has_many :safety_features, through: :car_safety_features
  has_many :car_comfort_interiors
  has_many :comfort_interior, through: :car_comfort_interiors
  has_one :color
  has_one :interior_color
  has_one :interior_design
end
