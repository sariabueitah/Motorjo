json.array!(@designcis) do |designci|
  json.extract! designci, :id, :title
  json.url designci_url(designci, format: :json)
end
