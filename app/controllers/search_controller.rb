class SearchController < ApplicationController
  
  def show
    restaurant_data = Adapters::RestaurantClient.new.build_restaurant_url(params['keyword'])
    sorted_camis = restaurant_data.map {|restaurant| restaurant['camis'] }.sort!.uniq!    
    
    sorted_restaurants = sorted_camis.map do |id|
      restaurant_data.select do |restaurant|
        restaurant if restaurant['camis'] == id
      end
    end

    @result = Restaurant.new.parse_data(sorted_restaurants) 
    render "/restaurants/show"
  end

end

