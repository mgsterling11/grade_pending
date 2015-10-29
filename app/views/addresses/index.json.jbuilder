json.array!(@addresses) do |address|
  json.extract! address, :id, :boro, :building, :street, :zipcode, :phone
  json.url address_url(address, format: :json)
end
