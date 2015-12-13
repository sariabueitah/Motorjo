class Color < ActiveRecord::Base
  belongs_to :car
  validates :title, presence: true
  translates :title
  globalize_accessors :locales => [:en ,:ar], :attributes => [:title]
  def cache_key
	  super + '-' + Globalize.locale.to_s
	end
end
