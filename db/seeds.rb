# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'pry'
# require 'json'
# binding.pry
  
json = JSON.parse('db/test_data.json')
JSON.parse(json)

json = ActiveSupport::JSON.decode(File.read('db/test_data.json')) 


json.each do |a| Test.create!(:idnumber => a‘idnumber’], :username => a‘username’, :firstname => a‘firstname’], :lastname => a‘lastname’], :email => a‘email’, :phonenumber => a‘phonenumber’], :isactive => a‘isactive’], :lastfour => a‘lastfour’],) end