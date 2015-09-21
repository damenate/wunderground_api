
puts "Enter a zip code:"
api = Conditions.new(gets.chomp)
puts api.current_conditions
