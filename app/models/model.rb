class Model < ActiveRecord::Base
	belongs_to :car
	belongs_to :make
	validates :title, :parent_id, presence: true
end
