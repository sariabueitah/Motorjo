json.array!(@models) do |model|
  json.extract! model, :id, :parent_id, :title
  json.url model_url(model, format: :json)
end
