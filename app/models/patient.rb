class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy

  validates :first_name, :last_name, :dob, :phone, :address, presence: true
end
