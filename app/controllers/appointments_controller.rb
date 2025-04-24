class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @patients = Patient.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :appointment_date)
  end
end
