class InteriorDesign < ActiveRecord::Base
  belongs_to :car
  validates :title, presence: true
  translates :title
  def cache_key
	  super + '-' + Globalize.locale.to_s
	end
end
