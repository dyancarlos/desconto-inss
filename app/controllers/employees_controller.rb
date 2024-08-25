class EmployeesController < ApplicationController
  before_action :fetch_employee, only: %i[edit update destroy]

  def index
    @employees = Employee.page(params[:page])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: t(".destroy")
    end
  end

  private

  def fetch_employee
    @employee = Employee.find(params[:id])
  end
end
