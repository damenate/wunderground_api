require 'httparty'
require 'byebug'

class Astronomy
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/AR/#{@zip}.json")
    end

    def sunrise
        hour = @response["moon_phase"]["sunrise"]["hour"]
        min = @response["moon_phase"]["sunrise"]["minute"]
        hour + min
    end

    def sunset
      hour = @response["moon_phase"]["sunset"]["hour"]
      min = @response["moon_phase"]["sunset"]["minute"]
      hour + min
    end
  end
