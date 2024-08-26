class ReportsController < ApplicationController
  def show
    @report = EmployeesReport.employees_by_rate
  end
end
