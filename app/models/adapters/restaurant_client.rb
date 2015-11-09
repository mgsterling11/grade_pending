require 'json'
require 'time'
require 'date'
require 'time_diff'
require 'pry'

module Adapters
  class RestaurantClient

binding.pry

    def connection
      @connection = Adapters::DataConnection.new
    end

    def query(url_string)                                   #<----- MOVE TO SEARCH MODEL
      #### WORKS WITH ZIPCODE
      data = RestClient::Request.execute(method: :get, url: "https://data.cityofnewyork.us/resource/9w7m-hzhe.json?$limit=50000&zipcode=10023")
      test_data = JSON.load(data)
    end

  #### SEARCH METHODS ####
#### INITIAL METHOD TO FIND RESTAURANT BY NAME              <----- MOVE TO SEARCH MODEL
    def find_by_name
      test = test_data.map do  |restaurant|
        restaurant if restaurant['dba'] == 'HEARTLAND BREWERY'  
      end.compact  
    end

  #### SEARCH METHODS ####


  #### CREATE SINGLE RESTAURANT HASH METHODS #### => 
##### METHOD TO SORT INSPECTION HASHES BY DATE              <----- DONE
    def inspection_date(inspection)
      inspection_dates = test.map do |inspection|
        Time.parse(inspection["inspection_date"])
      end
      inspection_dates.uniq!.sort! { |a,b| b <=> a }

      inspection_dates.each do |result|
        restaurant['inspection_date'] << result
      end
    end

## GRABS VIOLATION DESCRIPTIONS                             <----- DONE
    def inspection_results(inspection)
      restaurant_violations = test.map do |restaurant|
        restaurant['violation_description']
      end
      restaurant_violations.compact!

      restaurant_violations.each do |result|
        restaurant['violation_description'] << result
      end.uniq
    end

#### GRABS boro                                              <----- DONE
    def boro(inspection)
      restaurant['boro'] << test.first['boro']
    end

#### GRABS building                                          <----- DONE
    def building(inspection)                                               
      restaurant['building'] << test.first['building'].strip
    end

#### GRABS CUISINE DESCRIPTION
    def cuisine_description(inspection)                                               
      restaurant['cuisine_description'] << test.first['cuisine_description'].strip
    end

##### GRABS dba                                             <----- DONE
    def restaurant_name(inspection)                                               
      restaurant['dba'] << test.first['dba'].strip
    end

#### GRABS PHONE                                            <----- DONE
    def phone_num(inspection)    
      restaurant['phone'] << test.first['phone'].strip
      restaurant['phone'] = '(%s) %s-%s' % [restaurant['phone'][0,3], restaurant['phone'][3,3], restaurant['phone'][6,4]]
    end

#### GRABS street                                          <----- DONE
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

#### GRABS zipcode                                          <----- DONE
    def zipcode(inspection)                                               
      restaurant['zipcode'] << test.first['zipcode'].strip
    end

    #### CREATE SINGLE RESTAURANT HASH METHODS ####






##################### USE THIS TO FORMAT PHONE NUMBER VIA METHOD?
  # def formatted_number(number)
  #   if (number.length == 11 and digits[0] == '1')
  #     number.shift
  #   end

  #   if (number.length == 10)
  #     number = number.join
  #     '(%s) %s-%s' % [restaurant['phone'][0,3], restaurant['phone'][3,3], restaurant['phone'][6,4]]
  #   end
  # end



###### EMPTY RESTAURANT HASH
  # restaurant = {
  #   "boro"=> "",
  #   "building"=>"",
  #   "cuisine_description"=>"",
  #   "dba"=>"",
  #   "inspection_date"=> [],
  #   "phone"=>"",
  #   "street"=>"",
  #   "violation_code"=>[],
  #   "violation_description"=>[],
  #   "zipcode"=>""    
  # }
  
  



    end  
        
      end

    end
  





















    def find_restaurants(search)
      url = build_restaurant_url(search)
      connection.query(url)
    end

    def build_restuarant_url(search)
      params = {pickup_longitude: trip.origin.longitude, pickup_latitude: trip.origin.latitude, dropoff_longitude: trip.destination.longitude, dropoff_latitude: trip.destination.latitude}

      url_string = "https://data.cityofnewyork.us/resource/2yzn-sicd.json?$limit=50000&$where="
        params.each do | attribute, data |
          range1 = data - 0.001
          range2 = data + 0.001
          url_string += "#{attribute}%20%3E%20#{range1}%20AND%20#{attribute}%20%3C%20#{range2}%20AND%20"
        end
      url_string.chomp("%20AND%20")
    end 


 def build_uber_url(trip)
      params = {pickup_latitude: trip.origin.latitude, pickup_longitude: trip.origin.longitude, dropoff_longitude: trip.destination.longitude, dropoff_latitude: trip.destination.latitude}
      url_string = "https://api.uber.com/v1/estimates/price?start_latitude=#{params[:pickup_latitude]}&start_longitude=#{params[:pickup_longitude]}&end_latitude=#{params[:dropoff_latitude]}&end_longitude=#{params[:dropoff_longitude]}&server_token=1awe7eeZJLJ0MtUKWAuztdjprfE0siXFI8Bq2XO9"
      connection.query(url_string)
    end



# url_string = "https://data.cityofnewyork.us/resource/9w7m-hzhe.json?$limit=50000&$where=zipcode=10023"



# https://dev.socrata.com/foundry/#/data.cityofnewyork.us/9w7m-hzhe ## USE THESE TO FIND RIGHT DATA

  end
end
