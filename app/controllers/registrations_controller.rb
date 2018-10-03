
class MakeSchoolServer
  include HTTParty
end

class RegistrationsController < ApplicationController

  before_action :set_registration, only: [:show, :update, :destroy] # After action the curernt user will be set

  # The reason we want to skip before action is because a user shouldnt be required to log in to sign up for an app

  skip_before_action :require_login, only: [:create]

  # This file would be for registering a user or creating a user


  # POST /registrations
  def create
    # So what we have essentially done is that when the user on the client side makes the post request to this route we make a post request to the make school server
    user =  MakeSchoolServer.post("https://www.makeschool.com/login.json", body: {'user[email]' => request.headers[:email], 'user[password]' => request.headers[:password]})
    hashable_user = user.as_json


    if hashable_user['error'] == nil # If no error is being returned
      user_image_url = hashable_user['profile_image_url']
      p user_image_url
      user_first_name = hashable_user['first_name']
      user_last_name = hashable_user['last_name']
      user_id = hashable_user['id']

      @newUser = User.new(email: request.headers[:email], image_url: user_image_url, first_name: user_first_name, last_name: user_last_name, user_id: user_id)
      found_user = User.find_by({'email': request.headers['email']})

      if @newUser.save
          puts 'NEW USER ====> %s' %(@newUser.as_json)
          render json: @newUser

      elsif found_user
          render json: found_user

      else
          render json: {error: "USER WAS NOT SAVE TO THE DATABASE", status: 500}.to_json
      end

    else
      render json: {error: 'USER WAS NOT FOUND IN DATABASE', status: 500}.to_json

    end

  end



    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @current_user = User.find(params[:id])
      puts 'This is the current user' %(@current_user)
    end

    # Only allow a trusted parameter "white list" through.
    def registration_params
      params.permit(:email, :password, :token)
    end
end
