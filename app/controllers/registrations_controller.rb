
class Foo 
  include HTTParty
end
class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :update, :destroy]
  # The reason we want to skip before action is because a user shouldnt be required to log in to sign up for an app

  skip_before_action :require_login, only: [:create]

  # This file would be for registering a user or creating a user

 
  # POST /registrations
  def create
    # @registration = User.new(registration_params)

    # if @registration.save
    #   render json: @registration, only: [:token, :created_at, :email, :id]
    # else
    #   render json: @registration.errors, status: :unprocessable_entity
    # end

    # So the goal for the application is to use this route to make the request to http party

    user =  Foo.post("https://www.makeschool.com/login.json", body: {'user[email]' => params[:email], 'user[password]' => params[:password]})
    render user
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
