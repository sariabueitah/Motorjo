class Designci < ActiveRecord::Base
	has_many :cardesigncis
	has_many :cars, through: :cardesigncis
end
