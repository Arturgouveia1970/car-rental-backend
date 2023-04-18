class AuthenticationController < ApplicationController
  ALLOWED_DATA = %(email password).freeze

  # POST /auth/login
  def login
    data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
    @user = User.find_by_name!(data[:email])
    if @user.valid_password?(data[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     name: @user.email, role: @user.role, id: @user.id }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Username not found' }, status: :not_found
  end
end
