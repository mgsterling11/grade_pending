class SearchController < ApplicationController
  
  def index
    
    @search_results = Search.for(params[:keyword])
    
    if @search_results.length == 1
      redirect_to "/restaurants/#{@search_results.first.restaurant_id}"
    elsif @search_results.length > 1
      
      @restaurants_array = []
      
        @search_results.each do |restaurant|
           @restaurants_array << Restaurant.find_by(restaurant_id: restaurant) 
         end
      
      render "/search/multiple_results"
    else 
      #   render 'search/no_result.html'
    end   
  end

end
   
