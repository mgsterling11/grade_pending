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





##### METHOD TO SORT INSPECTION HASHES BY DATE              
    def inspection_date(inspection)
      inspection_dates = test.map do |inspection|
        Time.parse(inspection["inspection_date"])
      end
      inspection_dates.uniq!.sort! { |a,b| b <=> a }

      inspection_dates.each do |result|
        restaurant['inspection_date'] << result
      end
    end

## GRABS VIOLATION DESCRIPTIONS                             
    def inspection_results(inspection)
      restaurant_violations = test.map do |restaurant|
        restaurant['violation_description']
      end
      restaurant_violations.compact!
      restaurant_violations.uniq!

      restaurant_violations.map do |result|
        restaurant['violation_description'] << result
      end
    end

#### GRABS boro                                              
    def boro(inspection)
      restaurant['boro'] << test.first['boro']
    end

#### GRABS building                                          
    def building(inspection)                                               
      restaurant['building'] << test.first['building'].strip
    end

#### GRABS CUISINE DESCRIPTION
    def cuisine_description(inspection)                                               
      restaurant['cuisine_description'] << test.first['cuisine_description'].strip
    end

##### GRABS dba                                             
    def restaurant_name(inspection)                                               
      restaurant['dba'] << test.first['dba'].strip
    end

#### GRABS PHONE                                            
    def phone_num(inspection)    
      restaurant['phone'] << test.first['phone'].strip
      restaurant['phone'] = '(%s) %s-%s' % [restaurant['phone'][0,3], restaurant['phone'][3,3], restaurant['phone'][6,4]]
    end

#### GRABS street                                         
    def street(inspection)                                               
      restaurant['street'] << test.first['street'].gsub('  ','').strip
    end

###### GRABS VIOLATION CODES
    def violation_codes(inspection)
      violation_codes = test.map do |restaurant|
        restaurant['violation_code']
      end.compact
      violation_codes.uniq!

      violation_codes.each do |result|
        restaurant['violation_code'] << result
      end
    end

#### GRABS zipcode                                         
    def zipcode(inspection)                                               
      restaurant['zipcode'] << test.first['zipcode'].strip
    end

#### GRABS restaurant grade                                        
    def grade(inspection)                                               
      grades = test.map do |result|
        result['grade']
      end
      grades.compact!
      grades.uniq!
      grades.sort!

      grades.each do |grade|
        restaurant['grade'] << grade 
      end
    end




###### EMPTY RESTAURANT HASH
  restaurant = {
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
        

  end

