class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, only: %i[show]

  # POST /api/v1/register
  def create
    user = User.new(user_params)
    if user.save
      render json: { message: "User registered successfully", user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/user
  def show
    render json: @current_user, status: :ok
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header
    decoded = JWT.decode(token, Rails.application.credentials[:jwt_secret])[0]
    @current_user = User.find(decoded["user_id"])
  rescue JWT::DecodeError
    render json: { error: "Unauthorized" }, status: :unauthorized
  end
end
