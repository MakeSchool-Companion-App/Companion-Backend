class AttendancesController < ApplicationController
    before_action :set_attendance, only: %i[show update destroy]
    before_action :process_id, only: %i[create update]

    # GET /attendances
    def index
        '''Renders the a collection of the current users attendances'''
        render json: current_user.attendances
    end

    # GET /attendances/1
    def show
        '''Renders a single attendance object'''
        # attendance = Attendance.find_by({id: params[:id]})
        # puts 'This is the attendance %s ' %(@attendance)
        render json: @attendance
    end

    # POST /attendances
    def create
        '''Create an attendance object belonging to the current user '''
        @attendance = Attendance.new(attendance_params)
        @attendance.user = current_user

        if @attendance.save
            casted_beacon_id = {beacon_id: @attendance.beacon_id.to_s, id: @attendance.id, created_at: @attendance.created_at, updated_at: @attendance.updated_at, event: @attendance.event}
            # puts 'This is the casted beacon id %s' %(casted_beacon_id)
            render json: casted_beacon_id, status: :created
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

    def process_id
        # Converts string beacon title to id of beacon
        beacon = Beacon.find_by({title: attendance_params[:beacon_id]})

        # in case the request sent invalid parameters and no beacon was found
        if beacon
            params[:beacon_id] = beacon.id
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
        @attendance = Attendance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendance_params
        params.permit(:id, :beacon_id, :event_in, :event_out, :event)
    end
end
