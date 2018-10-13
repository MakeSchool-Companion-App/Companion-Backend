class Foo
  include HTTParty
end

class ActiveSessionsController < ApplicationController
  before_action :set_active_session, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:index, :show]
  # This file is for the pure use of logging a user in

  # GET /active_sessions
  def index

    @user = User.authenticate(params[:email], params[:password])
    render json: @user

  end

  # GET /active_sessions/1
  def show
    @user = User.authenticate(params[:email], params[:password])
    render json: @user, only: [:token, :created_at, :email, :id]
    # render json: @active_session
  end

  # POST /active_sessions
  def create
    @active_session = ActiveSession.new(active_session_params)

    if @active_session.save
      render json: @active_session, status: :created, location: @active_session
    else
      render json: @active_session.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /active_sessions/1
  def update
    if @active_session.update(active_session_params)
      render json: @active_session
    else
      render json: @active_session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /active_sessions/1
  def destroy
    @active_session.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_session
      @current_user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def active_session_params
      params.permit(:email, :password)
    end
end
