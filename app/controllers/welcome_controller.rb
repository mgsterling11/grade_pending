class WelcomeController < ApplicationController
  def index
    render 'index.html'
    @search = Search.new
  end
end
