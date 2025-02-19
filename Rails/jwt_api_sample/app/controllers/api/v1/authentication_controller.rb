class Api::V1::AuthenticationController < ApplicationController
  SECRET_KEY =  Rails.application.credentials[:jwt_secret]

  # POST /api/v1/login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = generate_token(user.id)
      render json: { token: token, user: { id: user.id, name: user.name, email: user.email } }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def generate_token(user_id)
    expiration = 24.hours.from_now.to_i
    payload = { user_id: user_id, exp: expiration }
    JWT.encode(payload, SECRET_KEY)
  end
end
