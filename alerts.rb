require 'httparty'
require 'byebug'

class Alerts
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/AR/#{@zip}.json")
    end

    def flash_flood
      @response["alerts"][0]["description"]
    end
end
