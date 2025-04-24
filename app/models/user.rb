class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Add role check methods
  def receptionist?
    role == 'receptionist'
  end

  def doctor?
    role == 'doctor'
  end
end




