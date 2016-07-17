class SessionsController < ApplicationController
  before_filter :authenticate,only: [:new]

  def authenticate
    if current_user.present?
      redirect_to root_url
    end
  end

  def new
  end

  def create
    employee = Employee.authenticate(params[:email], params[:password])
    if employee
      session[:employee_id] = employee.id
      redirect_to root_url
    else
      # flash.now.alert = "Invalid email or password"
      redirect_to root_url
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to root_url
  end
end
