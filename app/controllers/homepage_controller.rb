class HomepageController < ApplicationController
  def index
  	@cars = Car.last(10)
    @latest_special_car = Car.where(special_car: true).last
    @special_cars = Car.where(special_car: true).order(created_at: :desc).all[1..-1]


  end
  def get_model (id)
    @model = Model.find(id).title
  end
  helper_method :get_model
  def get_make (id)
    @make = Make.find(id).title
  end
  helper_method :get_make
end
