class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show,:update, :destroy]
  # skip_before_action :require_login, only: [:create]

  # GET /attendances
  def index
    # Have to find the user we are tracking an return all their attendances
    puts 'This is the instance variable current user %s' %(@current_user)
    render json: current_user.attendances
  end

  # GET /attendances/1
  def show
    render json: @attendance
  end

  # POST /attendances
  def create
    # @user = User.find_by_id(params[:id].to_i)
    @attendance = Attendance.new(attendance_params)
    @attendance.user = current_user()
    if @attendance.save
      render json: @attendance, only: [:beacon_id, :event ,:event_time, :id]
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
      params.permit(:id, :beacon_id, :event, :event_time)
    end
end
