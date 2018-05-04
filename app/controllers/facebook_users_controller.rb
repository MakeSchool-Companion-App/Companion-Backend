class FacebookUsersController < ApplicationController
  before_action :set_facebook_user, only: [:show, :update, :destroy]

  # GET /facebook_users
  def index
    @facebook_users = FacebookUser.all

    render json: @facebook_users
  end

  # GET /facebook_users/1
  def show
    render json: @facebook_user
  end

  # POST /facebook_users
  def create
    @facebook_user = User.new(facebook_user_params)

    if @facebook_user.save
      render json: @facebook_user
    else
      render json: @facebook_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /facebook_users/1
  def update
    if @facebook_user.update(facebook_user_params)
      render json: @facebook_user
    else
      render json: @facebook_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /facebook_users/1
  def destroy
    @facebook_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebook_user
      @facebook_user = FacebookUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def facebook_user_params
      params.fetch(:facebook_user, {})
    end
end
