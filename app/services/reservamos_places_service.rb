require 'rest-client'
class ReservamosPlacesService < ApplicationService
  BASE_URL = "https://search.reservamos.mx/api/v2/places"

  attr_accessor :query

  def initialize(query)
    @query = query
  end

  def call
    response = RestClient.get(BASE_URL, {
      params: {
        q: query
      }
    })
    { success: true, data: parse_response(response.body) }
  rescue RestClient::ExceptionWithResponse => e
    { success: false, error_message: handle_errors(e.response) }
  end
end
