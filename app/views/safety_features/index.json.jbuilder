json.array!(@safety_features) do |safety_feature|
  json.extract! safety_feature, :id, :title
  json.url safety_feature_url(safety_feature, format: :json)
end
