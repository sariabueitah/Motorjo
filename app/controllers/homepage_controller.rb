class HomepageController < ApplicationController
  def index
  	@latest_cars = Car.last(10)
    @latest_special_car = Car.where(special_car: true).last
    @special_cars = Car.where(special_car: true).order(created_at: :desc).all[1..-1]
  end
end
