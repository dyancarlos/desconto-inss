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
    @service  = Employees::CreateService.new(employee_params)
    @employee = @service.employee

    if @service.save
      redirect_to employees_path, notice: t(".success")
    else
      render :new
    end
  end

  def update
    @service  = Employees::UpdateService.new(@employee, employee_params)

    if @service.update
      redirect_to employees_path, notice: t(".success")
    else
      render :edit
    end
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
      :social_security_discount,
      :street_name,
      :street_number,
      :district,
      :city,
      :state,
      :zipcode
    )
  end
end
