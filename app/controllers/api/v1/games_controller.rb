class Api::V1::GamesController < ApplicationController
  before_action :find_game, only: [:show]
  def index
    @games = Game.all
    render json: @games
  end

  def show
    # render json: @game
    # @game_details  = {
    #   game: @game,
    #   home_team: Team.all.select {|t| t['id_team'] === @game['home_team_id']},
    #   away_team: Team.all.select {|t| t['id_team'] === @game['away_team_id']}
    # }

    render json: @game.game_details
  end

  private

  def game_params
    params.permit(:date, :away_team, :home_team, :city, :arena)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
