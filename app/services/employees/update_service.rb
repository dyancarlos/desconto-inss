class Employees::UpdateService
  attr_accessor :employee

  def initialize(employee, params)
    @employee = employee
    @params   = params
  end

  def update
    return if @employee.invalid?

    if @employee.update(@params)
      Employees::CalculateNetSalaryJob.perform_async(@employee.id)
    end
  end
end
