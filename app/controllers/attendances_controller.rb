class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :create,:update, :destroy]
  # skip_before_action :require_login, only [:create]

  # GET /attendances
  def index
    # Have to find the user we are tracking an return all their attendances
    @user = User.includes(:attendances).find_by_id(params[:id].to_i)

    render json: @user.attendances 
  end

  # GET /attendances/1
  def show
    render json: @attendance
  end

  # POST /attendances
  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.user_id = current_user.id

    if @attendance.save
      render json: @attendance, only: [:beacon_id, :event ,:event_time]
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendances/1
  def update
    if @attendance.update(attendance_params)
      render json: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendances/1
  def destroy
    @attendance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendance_params
      params.permit(:beacon_id, :event, :event_time)
    end
end

