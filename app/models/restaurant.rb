# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  name            :string
#  inspection_date :string
#  grade           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  restaurant_id   :integer
#

class Restaurant < ActiveRecord::Base
  has_one :violation_description
  has_one :address
  has_one :cuisine_type

  attr_accessor :restaurant

  @@all = []

  def initialize
    @restaurant = {
      "boro"=> "",
      "building"=>"",
      "grade"=>[],
      "cuisine_description"=>"",
      "dba"=>"",
      "inspection_date"=> [],
      "phone"=>"",
      "street"=>"",
      "violation_code"=>[],
      "violation_description"=>[],
      "zipcode"=>""    
    }
  end

  def parse_data(restaurants_data)
    results = restaurants_data.each do |restaurant|
      build_restaurant_hash(restaurant)
    end
    results
  end



  def build_restaurant_hash(restaurant)
    inspection_date(restaurant)
    inspection_results(restaurant)
    boro(restaurant)
    building(restaurant)                                               
    cuisine_description(restaurant)                                               
    restaurant_name(restaurant)                                               
    phone_num(restaurant)    
    street(restaurant)                                               
    violation_codes(restaurant)
    zipcode(restaurant)                                               
    grade(restaurant)
    @@all << @restaurant 
    @@all
  end


##### SORTS INSPECTION HASHES BY DATE              
    def inspection_date(restaurant)
      inspection_dates = restaurant.map do |inspection|
        Time.parse(inspection["inspection_date"])
      end

      inspection_dates.uniq!.sort! { |a,b| b <=> a }

      inspection_dates.each do |result|
        @restaurant['inspection_date'] << result
      end
    end

## GRABS VIOLATION DESCRIPTIONS                             
    def inspection_results(restaurant)
      restaurant_violations = restaurant.map do |restaurant|
        restaurant['violation_description']
      end
      restaurant_violations.compact!
      restaurant_violations.uniq!

      restaurant_violations.map do |result|
        @restaurant['violation_description'] << result
      end
    end

#### GRABS boro                                              
    def boro(restaurant)
      @restaurant['boro'] << restaurant.first['boro']
    end

#### GRABS building                                          
    def building(restaurant)                                               
      @restaurant['building'] << restaurant.first['building'].strip
    end

#### GRABS CUISINE DESCRIPTION
    def cuisine_description(restaurant)                                               
      @restaurant['cuisine_description'] << restaurant.first['cuisine_description'].strip
    end

##### GRABS dba                                             
    def restaurant_name(restaurant)                                               
      @restaurant['dba'] << restaurant.first['dba'].strip
    end

#### GRABS PHONE                                            
    def phone_num(restaurant)    
      @restaurant['phone'] << restaurant.first['phone'].strip
      @restaurant['phone'] = '(%s) %s-%s' % [@restaurant['phone'][0,3], @restaurant['phone'][3,3], @restaurant['phone'][6,4]]
    end

#### GRABS street                                         
    def street(restaurant)                                               
      @restaurant['street'] << restaurant.first['street'].gsub('  ','').strip
    end

###### GRABS VIOLATION CODES
    def violation_codes(restaurant)
      violation_codes = restaurant.map do |restaurant|
        restaurant['violation_code']
      end.compact
      violation_codes.uniq!

      violation_codes.each do |result|
        @restaurant['violation_code'] << result
      end
    end

#### GRABS zipcode                                         
    def zipcode(restaurant)                                               
      @restaurant['zipcode'] << restaurant.first['zipcode'].strip
    end

#### GRABS restaurant grade                                        
    def grade(restaurant)                                               
      grades = restaurant.map do |result|
        result['grade']
      end
      grades.compact!
      grades.uniq!
      grades.sort!

      grades.each do |grade|
        @restaurant['grade'] << grade 
      end
    end
end

