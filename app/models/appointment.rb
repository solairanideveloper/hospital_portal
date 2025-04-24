class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor, class_name: "User", foreign_key: "doctor_id"

  validates :appointment_date, presence: true
end
