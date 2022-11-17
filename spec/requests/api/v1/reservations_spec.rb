require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path '/api/v1/reservations' do
    get('list reservations') do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response(200, 'reservation found') do
        schema type: :object,
               properties: {
                 start_date: { type: :date },
                 end_date: { type: :date },
                 city: { type: :string },
                 user_id: { type: :bigint },
                 car_id: { type: :bigint }
               },
               required: %w[start_date end_date city user_id car_id]

        let(:id) do
          Reservation.create(start_date: '20-11-2022', end_date: '25-11-2022', city: 'Paris',
                             user_id: 1, car_id: 1)
        end
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          start_date: { type: :date },
          end_date: { type: :date },
          city: { type: :string },
          user_id: { type: :bigint },
          car_id: { type: :bigint }
        },
        required: %w[start_date end_date city user_id car_id]
      }

      response(200, 'successful') do
        let(:reservation) do
          { start_date: '20-11-2022', end_date: '25-11-2022', city: 'Paris',
            user_id: 1, car_id: 1 }
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    # You'll want to customize the parameter types...

    get('show reservation') do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response(200, 'successful') do
        schema type: :object,
               properties: {
                 start_date: { type: :date },
                 end_date: { type: :date },
                 city: { type: :string },
                 user_id: { type: :bigint },
                 car_id: { type: :bigint }
               },
               required: %w[start_date end_date city user_id car_id]

        let(:id) do
          Reservation.create(start_date: '20-11-2022', end_date: '25-11-2022', city: 'Paris',
                             user_id: 1, car_id: 1).id
        end
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete('delete reservation') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
