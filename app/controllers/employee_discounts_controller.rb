class EmployeeDiscountsController < ApplicationController
  def show
    salary = params[:salary].to_money
    discount = Employees::CalculateDiscountService.new(salary.cents).call
    render json: { discount: Money.from_cents(discount).format }
  end
end
