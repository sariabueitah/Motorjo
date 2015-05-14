json.array!(@interior_designs) do |interior_design|
  json.extract! interior_design, :id, :title
  json.url interior_design_url(interior_design, format: :json)
end
