class V1::UsersController < V1::ApiController
  def show
    respond_with User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 201, location: v1_user_url(@user)
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user, status: 200, location: v1_user_url(@user)
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  private

    def user_params
      params.require(:user).permit(:phone, :first_name, :last_name, :email, :password, :password_confirmation, :lat, :lng)
    end
end
