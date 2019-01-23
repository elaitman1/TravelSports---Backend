class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def login
    @user = User.all.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      render json: @user
    else
      render json: {status: "denied"}
    end
  end

  private

  def user_params
    params.permit(:username, :home_city, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
