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
      @response["moon_phase"]["sunrise"]["hour"]["minute"]
    end

    def sunset
      @response["moon_phase"]["sunset"]["hour"]["minute"]
    end
  end
