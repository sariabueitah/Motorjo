class CarComfortInterior < ActiveRecord::Base
  belongs_to :car
  belongs_to :comfort_interior
end
