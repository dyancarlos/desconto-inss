class EmployeesController < ApplicationController
  def index
    @employees = Employee.page(params[:page])
  end
end
