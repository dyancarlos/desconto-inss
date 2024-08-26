class EmployeesController < ApplicationController
  before_action :fetch_employee, only: %i[edit update destroy]

  def index
    @employees = Employee.page(params[:page])
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: t(".success")
    else
      render :new
    end
  end

  def update
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: t(".success")
    end
  end

  private

  def fetch_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :name,
      :cpf,
      :personal_phone,
      :reference_phone,
      :birthdate,
      :salary,
      :street_name,
      :street_number,
      :district,
      :city,
      :state,
      :zipcode
    )
  end
end
