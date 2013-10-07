json.array!(@products) do |product|
  json.extract! product, :displayname, :description, :location, :model, :vendor, :supplier, :cost, :value, :condition, :status, :category, :color, :uom, :user_id, :quantity, :acquired, :retired, :note, :image_url
  json.url product_url(product, format: :json)
end
