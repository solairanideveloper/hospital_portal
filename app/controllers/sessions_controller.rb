class SessionsController < ApplicationController
  
 def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      sign_in user
      if user.receptionist?
        redirect_to receptionist_dashboard_path
      elsif user.doctor?
        redirect_to doctor_dashboard_path
      else
        redirect_to root_path
      end
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end
end







