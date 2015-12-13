class Model < ActiveRecord::Base
	belongs_to :car
	belongs_to :make
	validates :title, :parent_id, presence: true
	translates :title
	globalize_accessors :locales => [:en ,:ar], :attributes => [:title]
	def cache_key
	  super + '-' + Globalize.locale.to_s
	end
end
