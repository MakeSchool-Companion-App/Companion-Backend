
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

      @newUser = User.new(email: params[:email])

      @newUser.save
    end

    '''The goal of yhis function is when the user hits this route that we post the email to the database  and why does tha
    t make sense what we have to do and that is when the user logs in they send email and password we take the email and use that to link the attendances
      '''
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
