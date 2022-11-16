class Api::V1::ReservationsController < ApplicationController
    # GET all
    def index
      @reservations = Reservation.all
      render json: @reservations, status: :ok
    end
  
    # GET 1
    def show
      render json: @reservations, status: :ok
    end
  
    # POST
    def create
      @car = Car.find(params[:doctor_id])
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        render json: @reservation, status: :ok
      else
        render json: { errors: @reservation.errors.full_message }, status: :unprocessable_entity
      end
    end
  
    def update
      if @reservation.update(reservation_params)
        render json: @reservation, status: :ok
      else
        render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @reservation = Reservation.find(params[:id])
      if @reservation.destroy
        render json: { message: 'reservation deleted successfully' }, status: :ok
      else
        render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_reservation
      @reservation = Reservation.find(params[:id])
  
      render json: { errors: 'reservation not found' }, status: :not_found
    end
  
    def reservation_params
      params.permit(:start_date, :end_date, :city, :user_id, :car_id)
    end
end