class Api::V1::CarsController < ApplicationController
#   def index
#     @cars = Car.all
#     render json: { status: 'Success', message: 'loaded cars', cars: @cars }, status: :ok
#   end

#   def show
#     @car = Car.find(params[:id])
#     render json: { car: @car }, status: :ok
#   end

#   def create
#     @car = Car.new(car_params)
#     if @car.save
#       render json: {
#         message: 'Car added successfully'
#       }, status: :created
#     else
#       render json: {
#         message: 'something went wrong'
#       }, status: :unprocessable_entity
#     end
#   end

#   def delete
#     @car = Car.find(params[:id])
#     if @car.destroy!
#       render json: { success: 'The car has been deleted successfully.' }
#     else
#       render json: { error: 'Something went wrong, please try again!' }, status: :unprocessable_entity
#     end
#   end

#   def reserve
#     @reserved_cars = Reservation.where(date: params[:date]).distinct.pluck(:car_id)
#     @cars = Car.all
#     @cars = @cars.reject { |car| @reserved_cars.include?(car.id) } unless @reserved_cars.empty?
#     render json: { cars: @cars }, status: :ok
#   end

#   def update
#     @car = Car.find(params[:id])
#     if @car.update(car_params)
#       render json: { message: 'Car updated succesfully.' }
#     else
#       render json: { message: 'Something went wrong' }, status: :unprocessable_entity
#     end
#   end

#   def user_cars
#     @cars = User.find(params[:user_id]).cars
#     render json: { cars: @cars }, status: :ok
#   end

#   private

#   def car_params
#     params.permit(:model, :year, :image, :price, :user_id)
#   end
end
