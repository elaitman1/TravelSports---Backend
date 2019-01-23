class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    render json: @user
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      render json: @trip, status: :accepted
    else
      render json: { errors: @trip.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.permit(:username, :home_city, :password_digest)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
