class V1::BikesController < V1::ApiController
  def show
    respond_with Bike.find(params[:id])
  end

  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      render json: @bike, status: 201, location: v1_user_url(@bike)
    else
      render json: { errors: @bike.errors }, status: 422
    end
  end

  def update
    @bike = Bike.find(params[:id])

    if @bike.update(bike_params)
      render json: @bike, status: 200, location: v1_bike_url(@bike)
    else
      render json: { errors: @bike.errors }, status: 422
    end
  end

  private

    def bike_params
      params.require(:bike).permit(:name, :model, :brand, :serial_number, :place_of_purchase)
    end
end
