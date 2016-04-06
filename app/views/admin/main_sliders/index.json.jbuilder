json.array!(@admin_main_sliders) do |admin_main_slider|
  json.extract! admin_main_slider, :id, :title, :description, :order
  json.url admin_main_slider_url(admin_main_slider, format: :json)
end
