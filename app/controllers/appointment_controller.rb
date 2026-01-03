class AppointmentController < ApplicationController
   def index
        @appointments = current_user.appointments
   end

   def new
    @appointment = Appointment.new
   end

   def create
    @appointment = current_user.appointments.build(new_appointment_params)

    if @appointment.save
        redirect_to appointments_path, notice: "Agendamento criado com Sucesso!"
    else
        render :new
    end
end

private 

    def appointments_params
        params.require(:appointment)
            .permit(:title, :start_time, :end_time)
    end
end