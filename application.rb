require './conditions'
require './forecast'
require 'json'


puts "Enter a zip code:"
zip = gets.chomp
api = Conditions.new(zip)
puts api.get_response


puts "Enter your zip for your 10-day forecast:"
api2 = Forecast.new(zip)
puts api2.
