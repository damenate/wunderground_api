require 'minitest/autorun'
require 'minitest/pride'
require './conditions'
require './forecast'
require './astronomy'
require './alerts'
require './hurricane'
require 'json'


class Conditions
  private def get_response
    file = File.read('72401.json')
    data_hash = JSON.parse(file)
  end
end

class Forecast
  private def get_response
    file = File.read('10day72401.json')
    data_hash = JSON.parse(file)
  end
end

class Astronomy
  private def get_response
    file = File.read('72401sun.json')
    data_hash = JSON.parse(file)
  end
end

class Alerts
  private def get_response
    file = File.read('85701alerts.json')
    data_hash = JSON.parse(file)
  end
end

class Hurricane
  private def get_response
    file = File.read('hurricane.json')
    data_hash = JSON.parse(file)
  end
end

class ConditionsTest < Minitest::Test

  def test_temp_at_location
    assert_equal 77.4, Conditions.new("72401").current_temp
  end

  def test_wind_mph_at_location
    assert_equal 1.1, Conditions.new("72401").current_wind
  end

  def test_humidity_at_location
    assert_equal "52%", Conditions.new("72401").humidity
  end

  def test_elevation_at_location
    assert_equal "100.00000000", Conditions.new("72401").elevation
  end

  def test_first_day_10_day_forcast_for_location
    assert_equal "Monday", Forecast.new("72401").day_one_day
  end

  def test_first_day_forcast_for_location
    assert_equal "Abundant sunshine. High 79F. Winds light and variable.", Forecast.new("72401").day_one_forecast
  end

  def test_second_day_10_day_forcast_for_location
    assert_equal "Tuesday", Forecast.new("72401").day_two_day
  end

  def test_second_day_forcast_for_location
    assert_equal "A mainly sunny sky. High 84F. Winds ENE at 5 to 10 mph.", Forecast.new("72401").day_two_forecast
  end

  def test_third_day_10_day_forcast_for_location
    assert_equal "Wednesday", Forecast.new("72401").day_three_day
  end

  def test_third_day_forcast_for_location
    assert_equal"Sunshine and some clouds. High 84F. Winds ENE at 5 to 10 mph.", Forecast.new("72401").day_three_forecast
  end

  def test_fourth_day_10_day_forcast_for_location
    assert_equal "Thursday", Forecast.new("72401").day_four_day
  end

  def test_fourth_day_forcast_for_location
    assert_equal "A few clouds early, otherwise mostly sunny. High around 85F. Winds NE at 5 to 10 mph.", Forecast.new("72401").day_four_forecast
  end

  def test_fifth_day_10_day_forcast_for_location
    assert_equal "Friday", Forecast.new("72401").day_five_day
  end

  def test_fifth_day_forcast_for_location
    assert_equal "Sunny skies. High near 85F. Winds NNE at 10 to 15 mph.", Forecast.new("72401").day_five_forecast
  end

  def test_sixth_day_10_day_forcast_for_location
    assert_equal "Saturday", Forecast.new("72401").day_six_day
  end

  def test_sixth_day_forcast_for_location
    assert_equal "Mostly sunny early. Becoming mostly cloudy with showers developing later in the day. High around 80F. Winds NE at 5 to 10 mph. Chance of rain 50%.", Forecast.new("72401").day_six_forecast
  end

  def test_seventh_day_10_day_forcast_for_location
    assert_equal "Sunday", Forecast.new("72401").day_seven_day
  end

  def test_seventh_day_forcast_for_location
    assert_equal "Some clouds in the morning will give way to mainly sunny skies for the afternoon. High around 80F. Winds ENE at 5 to 10 mph.", Forecast.new("72401").day_seven_forecast
  end

  def test_eight_day_10_day_forcast_for_location
    assert_equal "Monday", Forecast.new("72401").day_eight_day
  end

  def test_eight_day_forcast_for_location
    assert_equal "Generally sunny despite a few afternoon clouds. High 82F. Winds ESE at 5 to 10 mph.", Forecast.new("72401").day_eight_forecast
  end

  def test_ninth_day_10_day_forcast_for_location
    assert_equal "Tuesday", Forecast.new("72401").day_nine_day
  end

  def test_ninth_day_forcast_for_location
    assert_equal "A few clouds from time to time. Low 61F. Winds ENE at 5 to 10 mph.", Forecast.new("72401").day_nine_day_forecast
  end

  def test_tenth_day_forecast_for_location
    assert_equal "Wednesday", Forecast.new("72401").day_ten_day
  end

  def test_ninth_day_forcast_for_location
    assert_equal "Mostly cloudy early with showers developing later in the day. High 81F. Winds ENE at 5 to 10 mph. Chance of rain 50%.", Forecast.new("72401").day_ten_forecast
  end

  def test_sunrise_time
    assert_equal "649", Astronomy.new("72401").sunrise
  end

  def test_sunrise_time
    assert_equal "1901", Astronomy.new("72401").sunset
  end

  def test_weather_alerts
    assert_equal  "Flash Flood Warning", Alerts.new("85701").flash_flood
  end

  def test_first_hurricane_wind_speed
    assert_equal 50, Hurricane.new("Ida").wind_speed
  end

  def test_latitude_of_first_hurricane
    assert_equal 21.2, Hurricane.new("Ida").latitude
  end

  def test_longitude_of_first_hurricane
    assert_equal -48.8, Hurricane.new("Ida").longitude
  end

  def test_second_hurricane_wind_speed
    assert_equal 30, Hurricane.new("Twentyone").wind_speed2
  end

  def test_latitude_of_second_hurricane
    assert_equal 15.6, Hurricane.new("Twentyone").latitude2
  end

  def test_longitude_of_second_hurricane
    assert_equal 141.7, Hurricane.new("Twentyone").longitude2
  end

  def test_third_hurricane_wind_speed
    assert_equal 30, Hurricane.new("Sixteen-E").wind_speed3
  end

  def test_latitude_of_third_hurricane
    assert_equal 30.7, Hurricane.new("Twentyone").latitude3
  end

  def test_longitude_of_third_hurricane
    assert_equal -111.7, Hurricane.new("Twentyone").longitude3
  end





end
