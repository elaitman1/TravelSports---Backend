class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:show]
  def index
    @games = Game.all
    render json: @games
  end

  def show
    render json: @game
  end

  private

  def game_params
    params.permit(:date, :away_team, :home_team, :city, :arena)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
