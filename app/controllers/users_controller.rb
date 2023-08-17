class UsersController < ApplicationController
  def register
    if User.find_by(email: params[:email].downcase)
      render json: { error: 'UserEmail already exists! please choose another one.' }, status: :not_acceptable
    else
      @user = User.new(user_params)
      @user.email = @user.email.downcase
      if @user.save
        render json: { user: @user, logged_in: true }, status: :created
      else
        render json: { error: 'There was an error, please try again!' }, status: :internal_server_error
      end
    end
  end

  def login
    @user = User.find_by(email: params[:email].downcase)
    if @user
      render json: { user: @user, logged_in: true }, status: :ok
    else
      render json: { error: 'email is invalid.' }, status: :not_acceptable
    end
  end

  private

  def find_user
    @user = User.find_by_id!(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
end