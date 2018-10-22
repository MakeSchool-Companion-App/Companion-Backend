class AttendancesController < ApplicationController
    before_action :set_attendance, only: %i[show update destroy]

    # GET /attendances
    def index
        '''Renders the a collection of the current users attendances'''
        render json: current_user.attendances
    end

    # GET /attendances/1
    def show
        '''Renders a single attendance object'''
        attendance = Attendance.find_by({id: params[:id]})
        render json: attendance
    end

    # POST /attendances
    def create
        '''Create an attendance object belonging to the current user '''

        @attendance = Attendance.new(attendance_params)
        @attendance.user = current_user
        if @attendance.save
            render json: @attendance, only: %i[beacon_id event event_time id]
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
        params.permit(:id, :beacon_id, :event_in, :event_out)
    end
end
