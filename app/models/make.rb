class Make < ActiveRecord::Base
	belongs_to :car
	has_many :models
	validates :title, presence: true
	translates :title
	def cache_key
	  super + '-' + Globalize.locale.to_s
	end
end
