class SearchUsersController < ApplicationController
  before_action :set_search_user, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:show]

  # GET /search_users
  def index
    @search_users = SearchUser.all

    render json: @search_users
  end

  # GET /search_users/1
  def show
    @user = User.find_by({'email': params[:email]})
  end

  # POST /search_users
  def create
    @search_user = SearchUser.new(search_user_params)

    if @search_user.save
      render json: @search_user, status: :created, location: @search_user
    else
      render json: @search_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /search_users/1
  def update
    if @search_user.update(search_user_params)
      render json: @search_user
    else
      render json: @search_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /search_users/1
  def destroy
    @search_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_user
      @search_user = SearchUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def search_user_params
      params.permit(:email)
    end
end
