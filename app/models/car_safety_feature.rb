class CarSafetyFeature < ActiveRecord::Base
  belongs_to :car
  belongs_to :safety_feature
end
