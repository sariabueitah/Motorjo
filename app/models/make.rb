class Make < ActiveRecord::Base
	belongs_to :car
	has_many :models
	validates :title, presence: true
end
