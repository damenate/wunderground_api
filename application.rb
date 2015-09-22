require './conditions'
require './forecast'
require 'json'


puts "Enter a zip code:"
zip = gets.chomp
name = gets.chomp
api = Conditions.new(zip)
puts api.get_response


puts "Enter your zip for your 10-day forecast:"
api2 = Forecast.new(zip)
puts api2.get_response

puts "Enter your zip for the sunrise and sunset:"
api3 = Astronomy.new(zip)
puts api3.get_response


puts "Enter your zip for weather alerts:"
api4 = Alerts.new(zip)
puts api4.get_response

puts "Enter hurricane name:"
api5 = Hurricane.new(name)
puts api5.get_response
