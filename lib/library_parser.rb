
require 'pry'
require 'json'
require 'rest-client'

class LibraryParser
binding.pry
  def files
    data = RestClient::Request.execute(method: :get, url:'http://data.cityofnewyork.us/resource/9w7m-hzhe.json')
    test_data = JSON.parse(data)
  end

  def self.parse
    self.new.call
  end

  def parse_filename
    test_data[0]['boro']
    test_data[0]['boro']
  end

  def call
    files.each do |filename|
      build_objects(*filename)
    end
  end

  def build_objects(args)
    # restaurant = Restaurant.new(name: , address:, inspection_date: , grade:)
    # violation = ViolationDescription.new(violation_code: , violation_description: , restaurant_id: )
    # address = Address.new(boro: , building: , street: , zipcode: , phone: , restaurant_id: )
    # cuisine = CuisineType.new(cuisine_description: , restaurant_id: )
  end
end



  #   1) Restaurants
  #   (has_one :cuisine_description)
  #   (has_one :address)
  #   (has_one :violation_description)
  #   - Name
  #   - Address
  #   - Inspection date
  #   - grade name (A, B, C, grade Pending, closed)

  # 2) Violation description  
  #   (belongs_to :restaurant)
  #   - Violation code
  #   - Violation description
  #   - Restaurant Id

  # 3) ADDRESS
  #   (belongs_to :restaurant)
  #   - boro
  #   - building
  #   - street 
  #   - zipcode
  #   - phone
  #   -restaurant_ID

  # 4) - cuisine description
  #   (belongs_to :restaurant)
  #   -cuisine description
  #   -restaurant ID