class EmployeesController < ApplicationController
  before_filter :authenticate,only: [:show, :edit, :update, :destroy, :index]
  # before_filter :logged_in,only: [:new]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @top_employee = Employee.where(manager_id:-1).last
    @child = @top_employee.get_children
  end

  def authenticate
    unless current_user
      redirect_to log_in_url
    end
  end

  # def logged_in
  #   if current_user.present?
  #     redirect_to root_url
  #   end
  # end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        if current_user.present?
          redirect_to root_path and return
        end
        format.html { redirect_to log_in_path }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :manager_id, :phone, :email , :password, :password_confirmation)
    end
end
