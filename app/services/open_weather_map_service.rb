require 'rest-client'
class OpenWeatherMapService < ApplicationService
  API_KEY = Rails.application.credentials.openweathermap[:api_key]
  BASE_URL = "https://api.openweathermap.org/data/2.5/onecall".freeze

  attr_accessor :lat, :lon

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def forecasts
    response = RestClient.get(BASE_URL, {
      params: {
        lat: lat,
        lon: lon,
        units: 'metric',
        exclude: 'current,minutely,hourly',
        appid: API_KEY
      }
    })
    { success: true, data: parse_response(response.body) }
  rescue RestClient::ExceptionWithResponse => e
    if e.http_code == 400
      { success: true, data: [] }
    else
      { success: false, error_message: handle_errors(e.response) }
    end
  end
end
