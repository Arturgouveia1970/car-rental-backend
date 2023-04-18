class Api::V1::UsersController < ApplicationController
  # before_action :authorize_request, except: %i[index create]
  # before_action :find_user, except: %i[create index]

  ALLOWED_DATA = %(name email password).freeze

  # GET /users
  def index
    users = User.all
    render json: users, status: :ok
  end

  # GET /users/:id
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) && allow != 'role' }
    return render json: { error: 'Empty body. Could not create user.' }, status: :unprocessable_entity if data.blank?

    user = User.new(data)
    if user.save
      render json: user, status: :ok
    else
      render json: { error: 'Could not create user.' }, status: :unprocessable_entity
    end
  end

  # PUT /users/:id
  def update
    if current_user.is? :admin
      data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
      return render json: { error: 'Empty body. Could not update user.' }, status: :unprocessable_entity if data.blank?

      if @user.update(data)
        render json: @user, status: :ok
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unauthorized.' }, status: :unauthorized
    end
  end

  DELETE /users/:id
  def destroy
    if current_user.is? :admin
      @user.destroy
      render json: @user, status: :ok
    else
      render json: { error: 'Unauthorized.' }, status: :unauthorized
    end
  end

  def register
    if User.find_by(email: params[:email].downcase)
      render json: { error: 'Useremail already exists! please choose another one.' }, status: :not_acceptable
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
