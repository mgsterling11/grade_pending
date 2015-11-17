require 'json'
require 'time'
require 'date'
require 'pry'
require 'rest-client'

module Adapters
  class RestaurantClient

    def connection
      @connection = Adapters::DataConnection.new
    end

    def build_restaurant_url(search)
      url = Search.for(search.upcase)
      connection.query(url)
    end 

  end
end


# def query(url_string)                                   #<----- WORKING URL FOR REFERENCE, TO DELETE
    #   data = RestClient::Request.execute(method: :get, url: "https://data.cityofnewyork.us/resource/9w7m-hzhe.json?$limit=50000&zipcode=10036")
    #   test_data = JSON.load(data)
    # end
  
#### INITIAL METHOD TO FIND RESTAURANT BY NAME              <----- REFACTOR OUT
    # def find_by_name
    #   test = test_data.map do  |restaurant|
    #     restaurant if restaurant['dba'] == 'HEARTLAND BREWERY'  
    #   end.compact  
    # end


# url_string = "https://data.cityofnewyork.us/resource/9w7m-hzhe.json?$limit=50000&$where=zipcode=10023"

# https://dev.socrata.com/foundry/#/data.cityofnewyork.us/9w7m-hzhe ## USE THESE TO FIND RIGHT DATA