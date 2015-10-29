json.array!(@violation_descriptions) do |violation_description|
  json.extract! violation_description, :id, :violation_code, :violation_description, :restaurant_id
  json.url violation_description_url(violation_description, format: :json)
end
