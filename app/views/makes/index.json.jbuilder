json.array!(@makes) do |make|
  json.extract! make, :id, :title
  json.url make_url(make, format: :json)
end
