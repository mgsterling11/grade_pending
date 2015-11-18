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

class Restaurant 
  # < ActiveRecord::Base
  # has_one :violation_description
  # has_one :address
  # has_one :cuisine_type

  attr_accessor :boro, :building, :grade, :cuisine_description, :restaurant_name, :inspection_date, :phone_num, :street, :violation_codes, :inspection_results, :zipcode

  def initialize(boro, building, grade, cuisine_description, restaurant_name, inspection_date, phone_num, street, violation_codes, inspection_results, zipcode)
    @boro = boro
    @building = building
    @grade = grade
    @cuisine_description = cuisine_description
    @restaurant_name = restaurant_name
    @inspection_date = inspection_date
    @phone_num = phone_num
    @street = street
    @violation_codes = violation_codes
    @inspection_results = inspection_results
    @zipcode = zipcode
  end
end
