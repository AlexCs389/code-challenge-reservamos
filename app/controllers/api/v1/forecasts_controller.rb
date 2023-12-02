class Api::V1::ForecastsController < ApplicationController

  def index
    unless params[:city_name].present?
      return render_error(I18n.t("city_name_required"), :unprocessable_entity)
    end

    response_places = ReservamosPlacesService.new(params[:city_name]).call

    unless response_places[:success]
      return render_error(response_places[:error_message], :unprocessable_entity)
    end

    render json: build_forecasts(response_places[:data])
  end

  private

  def build_forecasts(places)
    places.map { |place| build_city_forecasts(place) }
  end

  def build_city_forecasts(place)
    lat, long = place["lat"], place["long"]

    response_openweather = OpenWeatherMapService.new(lat, long).forecasts
    raise response_openweather[:error_message] unless response_openweather[:success]

    {
      lat: lat,
      long: long,
      city_name: place["city_name"],
      forecasts: build_forecast_data(response_openweather[:data])
    }
  end

  def build_forecast_data(data)
    return [] if data.blank?

    data["daily"].map do |forecast|
      {
        datetime: Time.at(forecast["dt"]).to_datetime,
        temp_min: forecast["temp"]["min"],
        temp_max: forecast["temp"]["max"]
      }
    end
  end

end
