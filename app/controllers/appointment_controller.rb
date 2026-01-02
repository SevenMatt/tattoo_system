class AppointmentController < ApplicationController
    def index
        @appointments = Appointments.includes(:user)
    end

    def new 
        @appointment = Appointment.new
        @users = User.all
    end

    def create
        @appointment = Appointment.new(appointment_params)
        @users = Users.all

        if @appointment.save
            redirect_,to appointment_path
        else
            render :new
        end
end


private

    def appointment_params
        params.require(:appointment)
              .permit(:title, :start_time, :end_time, :user_id)
    end
end