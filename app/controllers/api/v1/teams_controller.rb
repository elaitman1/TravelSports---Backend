class Api::V1::TeamsController < ApplicationController
  before_action :find_team, only: [:show]

  def index
    @teams = Team.all
    render json: @teams
  end

  def show
    render json: @team
  end

  private

  def team_params
    params.permit(:name, :id_team, :stadium_img, :stadium_name, :stadium_location, :website, :logo)
  end

  def find_team
    @team = Team.find(params[:id])
  end
end
