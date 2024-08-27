class Employees::CalculateNetSalaryJob
  include Sidekiq::Job

  def perform(employee_id)
    Employee.find(employee_id).tap do |employee|
      employee.update!(
        net_salary_cents: employee.salary_cents - employee.social_security_discount_cents
      )
    end
  end
end
