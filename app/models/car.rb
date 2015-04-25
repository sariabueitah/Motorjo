class Car < ActiveRecord::Base
	has_many :cardesigncis
	has_many :designcis, through: :cardesigncis
  has_many :car_safety_features
  has_many :safety_features, through: :car_safety_features
end
