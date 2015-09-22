require 'httparty'
require 'byebug'

class Hurricane
  def initialize(name)
    @name = name
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/#{@name}/view.json")
    end


  def wind_speed
    @response["currenthurricane"][0]["Current"]["WindSpeed"]["Mph"]
  end

  def latitude
    @response["currenthurricane"][0]["Current"]["lat"]
  end

  def longitude
    @response["currenthurricane"][0]["Current"]["lon"]

  end


  def wind_speed2
    @response["currenthurricane"][1]["Current"]["WindSpeed"]["Mph"]
  end

  def latitude2
    @response["currenthurricane"][1]["Current"]["lat"]
  end

  def longitude2
    @response["currenthurricane"][1]["Current"]["lon"]
  end

  def wind_speed3
    @response["currenthurricane"][2]["Current"]["WindSpeed"]["Mph"]
  end

  def latitude3
    @response["currenthurricane"][2]["Current"]["lat"]
  end

  def longitude3
    @response["currenthurricane"][2]["Current"]["lon"]
  end
end
