class Model < ActiveRecord::Base
	belongs_to :car
	belongs_to :make
end
