require 'minitest/autorun'
require 'minitest/pride'
require './conditions'
require 'json'

class Conditions
  private def get_response
    file = File.read('72401.json')
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

end
