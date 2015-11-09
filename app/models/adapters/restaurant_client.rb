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
