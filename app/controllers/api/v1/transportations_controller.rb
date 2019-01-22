class Api::V1::TransportationsController < ApplicationController
  before_action :find_transportation, only: [:show]

  def index
    @transportations = Transportation.all
    render json: @transportations
  end

  def show
    render json: @transportation
  end

  private

  def transportation_params
    params.permit(:name)
  end

  def find_transportation
    @transportation = Transportation.find(params[:id])
  end
end
