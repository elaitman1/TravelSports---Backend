class Api::V1::HotelsController < ApplicationController
  before_action :find_hotel, only: [:show]

  def index
    @hotels = Hotel.all
    render json: @hotels
  end

  def show
    render json: @hotel
  end

  private

  def hotel_params
    params.permit(:name)
  end

  def find_hotel
    @hotel = Hotel.find(params[:id])
  end
end
