class InteriorColor < ActiveRecord::Base
  belongs_to :car
  validates :title, presence: true
end
