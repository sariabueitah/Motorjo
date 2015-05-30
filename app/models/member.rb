class Member < ActiveRecord::Base
	has_one :user, as: :meta, dependent: :destroy
	validates :first_name, :last_name, :phone_number, :address, presence: true
  	accepts_nested_attributes_for :user
end
