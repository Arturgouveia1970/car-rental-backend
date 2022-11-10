class Api::V1::CarsController < applicationController
  def index
    @cars = Cars.all
    render json: { status: 'Success', message: 'loaded cars', cars: @cars }, status: :ok
  end

  def show
    @cars = Car.includes(:reservations).find(params[:id])
    @reservations = @car.reservations.order(created_at: :desc)
    render json: { status: 'Success', message: 'loaded car', car: @car, reservations: @reservations },
           status: :ok
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
      render json: { message: 'Car deleted succesfully.' }
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
