json.array!(@dealers) do |dealer|
  json.extract! dealer, :id, :gallery_name, :gallery_location, :street_name, :building_number
  json.url dealer_url(dealer, format: :json)
end
