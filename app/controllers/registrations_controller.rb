class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :update, :destroy]
  # The reason we want to skip before action is because a user shouldnt be required to log in to sign up for an app

  skip_before_action :require_login, only: [:create]

  # This file would be for registering a user or creating a user

 
  # POST /registrations
  def create
    @registration = User.new(registration_params)

    if @registration.save
      render json: @registration, only: [:token, :created_at, :email, :id]
    else
      render json: @registration.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registration_params
      params.permit(:email, :password)
    end
end
