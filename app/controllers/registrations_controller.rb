
class MakeSchoolServer
  include HTTParty
end

class RegistrationsController < ApplicationController

  before_action :set_registration, only: [:show, :update, :destroy]

  # The reason we want to skip before action is because a user shouldnt be required to log in to sign up for an app

  skip_before_action :require_login, only: [:create]

  # This file would be for registering a user or creating a user


  # POST /registrations
  def create
    # So what we have essentially done is that when the user on the client side makes the post request to this route we make a post request to the make school server
    user =  MakeSchoolServer.post("https://www.makeschool.com/login.json", body: {'user[email]' => params[:email], 'user[password]' => params[:password]})

    if user != nil
      hashable_user = user.as_json
      user_image_url = hashable_user['profile_image_url']
      p user_image_url
      user_first_name = hashable_user['first_name']x
      user_last_name = hashable_user['last_name']
      user_id = hashable_user['id']


      @newUser = User.new(email: params[:email], image_url: user_image_url, first_name: user_first_name, last_name: user_last_name, user_id: user_id)
      user =  User.find_by({user_id: user_id})
      if user != nil
        puts "This is the user #{hashable_user}"
        render json: user

    else
      render json: {
          status: 404
      }.to_json
    end

    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registration_params
      params.permit(:email, :password, :token)
    end
end
