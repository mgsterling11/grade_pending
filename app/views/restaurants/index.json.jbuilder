json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :inspection_date, :grade
  json.url restaurant_url(restaurant, format: :json)
end
