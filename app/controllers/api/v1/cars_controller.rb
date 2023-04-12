class Api::V1::CarsController < ApplicationController
  before_action :authorize_request
  # before_action :find_vehicle, except: %i[create index]

  ALLOWED_DATA = %(model year image price).freeze

  def index
    @cars = Car.all
    render json: { status: 'Success', message: 'loaded cars', cars: @cars }, status: :ok
  end

  def show
    # @car = Car.includes(:reservations).find(params[:id])
    # @reservations = @car.reservations.order(created_at: :desc)
    # render json: { status: 'Success', message: 'loaded car', car: @car, reservations: @reservations },
    #        status: :ok

    @car = Car.find(params[:id])
    if @car
      render json: @car, include: [:reservations]
    else
      render json: { message: 'Unable to find @car', errors: @cars.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: {
        message: 'Car added successfully'
      }, status: :created
    else
      render json: {
        message: 'something went wrong'
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      render json: { message: 'Car deleted successfully.' }
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      render json: { message: 'Car updated succesfully.' }
    else
      render json: { message: 'Something went wrong' }, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:model, :year, :image, :price, :user_id)
  end
end
