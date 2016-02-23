require 'httparty'
require 'byebug'

class Conditions
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/AR/#{@zip}.json")
  end

  def current_temp
    @response["current_observation"]["temp_f"].to_f
  end

  def current_wind
    @response["current_observation"]["wind_mph"].to_f
  end

  def humidity
    @response["current_observation"]["relative_humidity"].to_s
  end

  def elevation
    @response["current_observation"]["display_location"]["elevation"].to_s
  end
end
                          
