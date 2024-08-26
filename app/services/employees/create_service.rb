class Employees::CreateService
  attr_accessor :employee

  def initialize(params)
    @employee = Employee.new(params)
  end

  def save
    return if @employee.invalid?

    if @employee.save
      Employees::CalculateDiscountJob.perform_async(@employee.id)
    end
  end
end
