class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_receptionist, only: [:new, :create, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_url, notice: 'Patient was successfully destroyed.'
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :phone, :address)
  end

  def check_receptionist
    redirect_to root_path unless current_user.receptionist?
  end
end
