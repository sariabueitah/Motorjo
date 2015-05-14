json.array!(@comfort_interiors) do |comfort_interior|
  json.extract! comfort_interior, :id, :title
  json.url comfort_interior_url(comfort_interior, format: :json)
end
