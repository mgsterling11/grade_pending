# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  
# data = JSON.parse(open('http://data.cityofnewyork.us/resource/9w7m-hzhe.json').read)

require 'pry'
require 'json'
require 'rest-client'



data = RestClient::Request.execute(method: :get, url:'http://data.cityofnewyork.us/resource/9w7m-hzhe.json')
test_data = JSON.parse(data)

# test_data = data.first

restaurant = Restaurant.new
address = Address.new
cuisine_type = CuisineType.new
violation_description = ViolationDescription.new
# test_data.each do |key|
#   restaurant.cuisine_description = data.first

# cuisine_type.cuisine_description = re


# => ["action",
#  "boro",z
#  "building",
#  "camis",
#  "critical_flag",
#  "cuisine_description",
#  "dba",
#  "inspection_date",
#  "inspection_type",
#  "phone",
#  "record_date",
#  "score",
#  "street",
#  "violation_code",
#  "violation_description",
#  "zipcode"]






# json = ActiveSupport::JSON.decode(File.read('db/test_data.json')) 

# json.each do |a| Test.create!(:idnumber => a‘idnumber’], :username => a‘username’, :firstname => a‘firstname’], :lastname => a‘lastname’], :email => a‘email’, :phonenumber => a‘phonenumber’], :isactive => a‘isactive’], :lastfour => a‘lastfour’],) end