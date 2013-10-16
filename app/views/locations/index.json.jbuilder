json.array!(@locations) do |location|
  json.extract! location, :location_name
  json.url location_url(location, format: :json)
end
