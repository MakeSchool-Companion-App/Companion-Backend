class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:create, :destroy], raise: false

  # GET /users

  # The only difference between this function and the show function is that this returns all the users whilst the show function only
  # returns the current logged in user
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    # So we can fetch specific users by their index the token is just to grant us access to the data
    render json: @user
  end

  # POST /users
  # Usual post request this essentially makes orm posts a user to the database
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1

  # This function is deleteing the current user any thing denoted by just as users references the current user
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:email, :password)
    end
end
