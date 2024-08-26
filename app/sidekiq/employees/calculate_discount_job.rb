class Employees::CalculateDiscountJob
  include Sidekiq::Job

  def perform(employee_id)
    Employee.find(employee_id).tap do |employee|
      employee.update!(
        social_security_discount_cents: Employees::CalculateDiscountService.new(employee.salary_cents).call
      )
    end
  end
end
