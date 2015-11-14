class SearchController < ApplicationController
  
  def show
    restaurant_data = Adapters::RestaurantClient.new.build_restaurant_url(params['keyword'])
    binding.pry
    @result = Restaurant.new.build_restaurant_hash(restaurant_data) 
    render "/restaurants/show"
  end


end

 




#### SORT MULTIPLE LISTINGS INTO ONE, USE CAMIS

sorted_restaurants = restaurant_data.sort_by { |restaurant| restaurant['camis'] }
results = << sorted_restaurants.shift


  x=0
  while x < sorted_restaurants.length do 
    sorted_restaurants.each do |restaurant|
      if restaurant['camis']
      results << restaurant
      
      restaurant['camis'] == restaurant['camis']
    x+=1
  end
  url_string
end




a.inject(&:merge)

#   def index
    
#     @search_results = Search.for(params[:keyword])
    
#     if @search_results.length == 1
#       redirect_to "/restaurants/#{@search_results.first.restaurant_id}"
#     elsif @search_results.length > 1
      
#       @restaurants_array = []
      
#         @search_results.each do |restaurant|
#            @restaurants_array << Restaurant.find_by(restaurant_id: restaurant) 
#          end
      
#       render "/search/multiple_results"
#     else 
#       #   render 'search/no_result.html'
#     end   
#   end

# end
