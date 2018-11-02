class MakeSchoolServer # LIBRARY FOR CONSUMING MAKE SCHOOLS API
    include HTTParty
end

class RegistrationsController < ApplicationController
    before_action :set_registration, only: %i[show update destroy] # After action the curernt user will be set
    skip_before_action :require_login, only: [:create]

    # POST /registrations
    def create
        '''
        Consume MakeSchools API to authenticate students with their database
        '''
        if request.headers[:Cookie].nil?
            user = MakeSchoolServer.post('https://www.makeschool.com/login.json', body: { 'user[email]' => request.headers[:email], 'user[password]' => request.headers[:password] })

        else
            user = MakeSchoolServer.post('https://www.makeschool.com/login.json', body: { 'user[email]' => request.headers[:email], 'user[password]' => request.headers[:password] }, headers: {'Cookie' => request.headers[:Cookie]})
        end


        hashable_user = user.as_json # Cast user object as a json object

        # If there is an error present in the object then render an error
        if hashable_user['error'].nil?
            # Forming our student object for our database
            user_image_url = hashable_user['profile_image_url']
            user_first_name = hashable_user['first_name']
            user_last_name = hashable_user['last_name']
            user_id = hashable_user['id']

            @newUser = User.new(email: request.headers[:email], image_url: user_image_url, first_name: user_first_name, last_name: user_last_name, user_id: user_id)
            found_user = User.find_by('email': request.headers['email'])

            if @newUser.save # If user saves successfully
                puts format('NEW USER ====> %s', @newUser.as_json)
                render json: @newUser

            elsif found_user # If the user doesn't save check if they already exist
                render json: found_user

            else # If neither user was not authenticated
                render json: { error: 'USER WAS NOT SAVE TO THE DATABASE'}.to_json, :status => 404
            end

        else
            render json: { error: 'STUDENT DOES NOT EXIST'}.to_json, :status => 404

        end
      end

    # Use callbacks to share common setup or constraints between actions.
    def set_registration
        @current_user = User.find(params[:id])
        puts format('This is the current user', @current_user)
    end

end
