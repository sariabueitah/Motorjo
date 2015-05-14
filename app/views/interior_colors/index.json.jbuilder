json.array!(@interior_colors) do |interior_color|
  json.extract! interior_color, :id, :title
  json.url interior_color_url(interior_color, format: :json)
end
