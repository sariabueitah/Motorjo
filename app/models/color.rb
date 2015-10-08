class Color < ActiveRecord::Base
  belongs_to :car
  validates :title, presence: true
  translates :title
end
