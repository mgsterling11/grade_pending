class SearchController < ApplicationController
  
  def show
    restaurant_data = Adapters::RestaurantClient.new.build_restaurant_url(params['keyword'])
    # sorted_data = restaurant_data.sort_by {|restaurant| restaurant['camis'] }

    # x= 0
    # sorted_data.each do |restaurant|
    #   while x < sorted_data.length do  restaurant['camis'] == restaurant['camis']
    #     restaurant.each_with_object([]) {|hash, a| a << hash }
    #   end
    # end
    # binding.pry
    # camis_array = restaurant_data.map do |restaurant| 
    #   restaurant['camis']
    # end.sort!.uniq!
    
    @result = Restaurant.new.build_restaurant_hash(restaurant_data) 
    render "/restaurants/show"
  end


end









#### SORT MULTIPLE LISTINGS INTO ONE, USE CAMIS



#   x=0
#   while x < sorted_restaurants.length do 
#     sorted_restaurants.each do |restaurant|
#       if restaurant['camis']
#       results << restaurant
      
#       restaurant['camis'] == restaurant['camis']
#     x+=1
#   end
#   url_string
# end




# a.inject(&:merge)

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
