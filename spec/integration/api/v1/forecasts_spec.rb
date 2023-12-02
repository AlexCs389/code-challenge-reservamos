require 'swagger_helper'

describe 'Forecasts API' do
  path '/api/v1/forecasts' do
    get 'Get forecasts by city' do
      tags 'Forecasts'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :city_name, in: :query, type: :string, required: true, description: 'City name'

      response '200', 'Successfully obtained forecasts' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   lat: {
                     type: :string,
                     example: "20.9673702"
                   },
                   long: {
                     type: :string,
                     example: "-89.5925857"
                   },
                   city_name: {
                     type: :string,
                     example: "Mérida"
                   },
                   forecasts: {
                     type: :object,
                     properties: {
                       datetime: {
                         type: :string,
                         format: "date-time",
                         example: "2023-12-01T11:00:00.000-06:00"
                       },
                       temp_min: {
                         type: :number,
                         multipleOf: 0.1,
                         example: 22.06
                       },
                       temp_max: {
                         type: :number,
                         multipleOf: 0.1,
                         example: 34.6
                       }
                     }
                   }
                 }
               }

        run_test!
      end

      response '422', 'Forecasts could not be obtained' do
        schema type: :object,
               properties: {
                 success: {
                   type: :boolean
                 },
                 error_message: {
                   type: :string
                 }
               }

        run_test!
      end

      response '500', 'An unexpected error occurred' do
        schema type: :object,
               properties: {
                 error_message: {
                   type: :string
                 }
               }

        run_test!
      end
    end
  end
end
