json.array!(@conditions) do |condition|
  json.extract! condition, :condition_name
  json.url condition_url(condition, format: :json)
end
