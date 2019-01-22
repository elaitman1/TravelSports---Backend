class Api::V1::TripsController < ApplicationController
  before_action :find_trip, only: [:show, :update, :destroy]
  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    render json: @trip
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      render json: @trip, status: :accepted
    else
      render json: { errors: @trip.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      render json: @trip, status: :accepted
    else
      render json: { errors: @trip.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @trip.destroy
  end

  private

  def trip_params
    params.permit(:game_id, :user_id, :title, :hotel_id, :transportation_id)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
