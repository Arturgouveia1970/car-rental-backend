require 'swagger_helper'

RSpec.describe 'api/v1/cars', type: :request do

  path '/api/v1/cars' do

    get('list cars') do
      response(200, 'successful') do
        let(:user_id) { User.create(name: 'Artur', role: 'admin', email: 'art@email.com').id }
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

    post('create car') do
      tags 'Cars'
        consumes 'application/json'
        parameter model: :cars, in: :body, schema: {
          type: :object,
          properties: {
            model: { type: :string },
            year: { type: :integer },
            image: { type: :string },
            price: { type: :decimal }
          },
          required: %w[model year image price]
        }
        response(200, 'successful') do
          let(:car) { { model: 'Mercedes', year: '2021', image: 'www.google.com', price: '350.50' } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:car) { { model: 'foo' } }
          run_test!
        end
    end
  end

  path '/api/v1/cars/{id}' do
    # You'll want to customize the parameter types...
    get('show car') do
      tags 'Car', 'another tag'
      produces 'application/json'
      parameter model: :id, in: :path, type: :string

      response '200', 'car found' do
        schema type: :object,
          properties: {
            model: { type: :string },
            year: { type: :integer },
            image: { type: :string },
            price: { type: :decimal }
          },
          required: %w[model year image price]
        let(:id) { Car.create(model: 'Mercedes', year: '2021', image: 'www.google.com', price: '350.50').id }
        run_test!
      end

      response '404', 'Car not found' do
        let(:id) { 'invalid'}
        run_test!
      end
    end

    patch('update car') do
      tags 'Cars'
      parameter model: :cars, in: :body, schema: {
        type: :object,
        properties: {
          model: { type: :string },
          year: { type: :integer },
          image: { type: :string },
          price: { type: :decimal }
        },
        required: %w[model year image price]
      }
      response(200, 'successful') do
        let(:id) {'123'}
        User.create(name: 'user', role: 'admin', email: 'user@gmail.com', password: '123456').id
        let(:car) do
          Car.create(model: 'Mercedes', year: '2021', image: 'www.google.com', price: '350.50').id
        end
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

    

    delete('delete car') do
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
