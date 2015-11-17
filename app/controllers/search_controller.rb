class SearchController < ApplicationController
  
  def show
    restaurant_data = Adapters::RestaurantClient.new.build_restaurant_url(params['keyword'])
    sorted_camis = restaurant_data.map {|restaurant| restaurant['camis'] }.sort!.uniq!    
    
    sorted_restaurants = sorted_camis.map do |id|
      restaurant_data.select do |restaurant|
        restaurant if restaurant['camis'] == id
      end
    end
  
    @result = sorted_restaurants.map {|restaurant| Restaurant.new(restaurant) }   
    
    if @result.length == 1
      render "/restaurants/show"
    else 
      render "/restaurants/index"
    end
  end

end

