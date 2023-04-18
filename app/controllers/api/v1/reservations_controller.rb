class Api::V1::ReservationsController < ApplicationController
  ALLOWED_DATA = %(user_id car_id start_date end_date city).freeze
  # GET all
  #   def index
  #     @reservations = User.find(params[:user_id]).reservations
  #     @result = []
  #     @reservations.each do |res|
  #       @result << { reservation: res, car: Car.find(res.car_id) }
  #     end
  #     render json: { reservations: @result }, status: :ok
  #   end

  #   # GET 1
  #   def show
  #     params.include?('vehicle_id') ? show_vehicle : show_user
  #   end

  #   # POST
  #   def create
  #     @reserved_cars = Reservation.where(date: params[:date]).distinct.pluck(:car_id)
  #     if @reserved_cars.include? params[:car_id].to_i
  #       render json: {
  #         error: 'This car is reserved on this date, please choose another date.'
  #       }, status: :not_acceptable
  #     else
  #       @reservation = Reservation.new(reservation_params)
  #       if @reservation.save
  #         render json: { success: 'The reservation has been created successfully.' }, status: :created
  #       else
  #         render json: { error: 'There was an error, please try again.' }, status: :internal_server_error
  #       end
  #     end
  #   end

  #   def update
  #     if @reservation.update(reservation_params)
  #       render json: @reservation, status: :ok
  #     else
  #       render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
  #     end
  #   end

  #   def destroy
  #     @reservation = Reservation.find(params[:id])
  #     if @reservation.destroy
  #       render json: { message: 'reservation deleted successfully' }, status: :ok
  #     else
  #       render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
  #     end
  #   end

  #   private

  #   def set_reservation
  #     @reservation = Reservation.find(params[:id])

  #     render json: { errors: 'reservation not found' }, status: :not_found
  #   end

  #   def reservation_params
  #     params.permit(:start_date, :end_date, :city, :user_id, :car_id)
  #   end
  # end

  def index_car
    car = Car.find_by_id!(params[:car_id])
    reservations = car.reservations
    render json: reservations, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Car  not found' }, status: :not_found
  end

  def index_user
    user = User.find_by_id!(params[:user_id])
    reservations = user.reservations
    render json: reservations, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def index
    params.include?('car_id') ? index_car : index_user
  end

  def show_car
    car = Car.find_by_id!(params[:car_id])
    reservation = car.reservations.find_by_id!(params[:id])
    render json: reservation, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Car/Reservation not found' }, status: :not_found
  end

  # def show_user
  #   user = User.find_by_id!(params[:user_id])
  #   reservation = user.reservations.find_by_id!(params[:id])
  #   render json: booking, status: :ok
  # rescue ActiveRecord::RecordNotFound
  #   render json: { errors: 'User/Booking not found' }, status: :not_found
  # end

  def show
    params.include?('car_id') ? show_car : show_user
  end

  def create_car_reservation
    car = Car.find(params[:car_id])
    reservation = car.reservations.new(@data)
    if reservation.save
      render json: reservation, status: :ok
    else
      render json: { error: 'Could not create reservation.' }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Car not found' }, status: :not_found
  end

  def create_user_booking
    user = User.find(params[:user_id])
    reservation = user.reservations.new(@data)
    if reservation.save
      render json: reservation, status: :ok
    else
      render json: { error: 'Could not create reservation.' }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def create
    @data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
    if @data.empty?
      return render json: { error: 'Empty body. Could not create reservation.' },
                    status: :unprocessable_entity
    end
    create_user_reservation if @data.include?('vehicle_id')
    create_car_reservation if @data.include?('user_id')
    return if @data.include?('car_id') || @data.include?('user_id')

    render json: { error: 'Could not create reservation.' }, status: :unprocessable_entity
  end
end
