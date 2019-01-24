class Api::V1::ExperiencesController < ApplicationController
  before_action :find_experience, only: [:show, :update]

  def index
    @experiences = Experience.add_game_ids
    render json: @experiences
  end

  def show
    render json: @experience.add_game_id
  end

  def create
    @trip = Experience.new(experience_params)
    if @trip.save
      render json: @trip, status: :accepted
    else
      render json: { errors: @trip.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @experience.update(experience_params)
    if @experience.save
      render json: @experience, status: :accepted
    else
      render json: { errors: @experience.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def experience_params
    params.permit(:trip_id, :img_url, :review, :rating)
  end

  def find_experience
    @experience = Experience.find(params[:id])
  end
end
