require 'httparty'
require 'byebug'

class Forecast
  def initialize(zip)
    @zip = zip
    @response = get_response
  end

  private def get_response
    key = ENV['WUNDERGROUND_KEY']
    HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/AR/#{@zip}.json")
    end

    # def day_one_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][0]["title"]
    # end
    #
    # def day_one_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][0]["fcttext"]
    # end
    #
    # def day_two_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][2]["title"]
    # end
    #
    # def day_two_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][2]["fcttext"]
    # end
    #
    # def day_three_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][4]["fcttext"]
    # end
    #
    # def day_three_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][4]["title"]
    # end
    #
    # def day_four_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][6]["fcttext"]
    # end
    #
    # def day_four_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][6]["title"]
    # end
    #
    # def day_five_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][8]["title"]
    # end
    #
    # def day_five_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][8]["fcttext"]
    # end
    #
    # def day_six_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][10]["title"]
    # end
    #
    # def day_six_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][10]["fcttext"]
    # end
    #
    # def day_seven_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][12]["title"]
    # end
    #
    # def day_seven_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][12]["fcttext"]
    # end
    #
    # def day_eight_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][14]["title"]
    # end
    #
    # def day_eight_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][14]["fcttext"]
    # end
    #
    # def day_nine_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][16]["title"]
    # end
    #
    # def day_nine_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][16]["fcttext"]
    # end
    #
    # def day_ten_day
    #   @response["forecast"]["txt_forecast"]["forecastday"][18]["title"]
    # end
    #
    # def day_ten_forecast
    #   @response["forecast"]["txt_forecast"]["forecastday"][18]["fcttext"]
    # end

      def forecast_day(period)
        @response["forecast"]["txt_forecast"]["forecastday"][period]["title"]
      end

     def forecast_text(period)
       @response["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]
     end

     def forecast_all
       forecast = {}
       (0..18).step(1) {|period| forecast[forecast_day(period)] = forecast_text(period)}
       forecast.flatten
     end
end
