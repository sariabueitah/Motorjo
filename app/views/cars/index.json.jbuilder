json.array!(@cars) do |car|
  json.extract! car, :id, : title, :description, :year, :mileage, :price, :car_location, :contact_number
  json.url car_url(car, format: :json)
end
