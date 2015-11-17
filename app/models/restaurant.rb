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

class Restaurant 
  # has_one :violation_description
  # has_one :address
  # has_one :cuisine_type

  # attr_accessor :restaurant, :boro, :building, :grade, :cuisine_description, :restaurant_name, :inspection_date, :phone_num, :street, :violation_codes, :inspection_results, :zipcode


  

  def initialize(restaurant)
    
    @boro = boro(restaurant)
    @building = building(restaurant)
    @grade = grade(restaurant)
    @cuisine_description = cuisine_description(restaurant)
    @restaurant_name = restaurant_name(restaurant)
    @inspection_date = inspection_date(restaurant)
    @phone_num = phone_num(restaurant)
    @street = street(restaurant)
    @violation_codes = violation_codes(restaurant)
    @inspection_results = inspection_results(restaurant)
    @zipcode = zipcode(restaurant)
    self
    binding.pry
  end

  # def parse_data(restaurants_data)
  #   results = restaurants_data.each do |restaurant|
  #     build_restaurant_hash(restaurant)
  #   end
  #   results
  # end



  # def build_restaurant_hash(restaurant)
  #   inspection_date(restaurant)
  #   inspection_results(restaurant)
  #   boro(restaurant)
  #   building(restaurant)                                               
  #   cuisine_description(restaurant)                                               
  #   restaurant_name(restaurant)                                               
  #   phone_num(restaurant)    
  #   street(restaurant)                                               
  #   violation_codes(restaurant)
  #   zipcode(restaurant)                                               
  #   grade(restaurant)
  #   @@all << @restaurant 
  #   @restaurant
  # end


##### SORTS INSPECTION HASHES BY DATE              
    def inspection_date(restaurant)
      inspection_dates = restaurant.map do |inspection|
        Time.parse(inspection["inspection_date"])
      end

      inspection_dates.uniq!.sort! { |a,b| b <=> a }

      dates = inspection_dates.map do |result|
        result
      end
      dates
    end

## GRABS VIOLATION DESCRIPTIONS                             
    def inspection_results(restaurant)
      restaurant_violations = restaurant.map do |restaurant|
        restaurant['violation_description']
      end
      restaurant_violations.compact!
      restaurant_violations.uniq!

      results = restaurant_violations.map do |result|
        result
      end
      results
    end

#### GRABS boro                                              
    def boro(restaurant)
      restaurant.first['boro']
    end

#### GRABS building                                          
    def building(restaurant)                                               
      restaurant.first['building'].strip
    end

#### GRABS CUISINE DESCRIPTION
    def cuisine_description(restaurant)                                               
      restaurant.first['cuisine_description'].strip
    end

##### GRABS dba                                             
    def restaurant_name(restaurant)                                               
      restaurant.first['dba'].strip
    end

#### GRABS PHONE                                            
    def phone_num(restaurant)    
      number = restaurant.first['phone'].strip
      # number = '(%s) %s-%s' % [@restaurant['phone'][0,3], @restaurant['phone'][3,3], @restaurant['phone'][6,4]]
    end

#### GRABS street                                         
    def street(restaurant)                                               
      restaurant.first['street'].gsub('  ','').strip
    end

###### GRABS VIOLATION CODES
    def violation_codes(restaurant)
      violation_codes = restaurant.map do |restaurant|
        restaurant['violation_code']
      end.compact
      violation_codes.uniq!

      codes = violation_codes.map do |result|
        result
      end
      codes
    end

#### GRABS zipcode                                         
    def zipcode(restaurant)                                               
      restaurant.first['zipcode'].strip
    end

#### GRABS restaurant grade                                        
    def grade(restaurant)                                               
      grades = restaurant.map do |result|
        result['grade']
      end
      grades.compact!
      grades.uniq!
      grades.sort!

      inspection_grades = grades.map do |grade|
        grade 
      end
      inspection_grades
    end
end

