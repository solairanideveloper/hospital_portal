class DoctorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = Patient.all
  end

  def patient_chart
    @patient_counts = Patient.group_by_day(:created_at).count
  end
end



