class ActiveSessionsController < ApplicationController
  before_action :set_active_session, only: [:show, :update, :destroy]

  # GET /active_sessions
  def index
    @active_sessions = ActiveSession.all

    render json: @active_sessions
  end

  # GET /active_sessions/1
  def show
    render json: @active_session
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
      @active_session = ActiveSession.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def active_session_params
      params.fetch(:active_session, {})
    end
end
