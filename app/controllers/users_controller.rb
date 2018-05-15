class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:index, :create, :show], raise: false

  # GET /users

  # The only difference between this function and the show function is that this returns all the users whilst the show function only
  # returns the current logged in user
  def index
    
    # @user = User.find_by_token(params[:token])
    # user_token = request.headers[:Authorization]
    # user_token.slice!(0,12)
    # @user = User.where({"token":user_token})
    # p user_token
    # @user = User.find_by({'email': params[:email]})
    # if @user.present?
    #   render json: @user
    # else:
    #   @user = User.find_by({'email': params[:email]})
    #   render json: @user
    
    end

  # GET /users/1
  def show
    @user = User.find_by({'email': params[:email]})
    # So we can fetch specific users by their index the token is just to grant us access to the data
    render json: @user, only: [:token, :created_at, :email, :id]
  end

  # POST /users
  def create
    @facebook_user = User.new(user_params)

    if @facebook_user.save
      render json: @facebook_user
    else
      render json: @facebook_user.errors, status: :unprocessable_entity
    end
  end



  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, only: [:token, :created_at, :email, :id, :updated_at]
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
      params.permit(:email, :password, :first_name, :username, :image_url, :last_name)
    end
end
