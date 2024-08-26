class Employees::CalculateDiscountService
  def initialize(salary)
    @salary = salary
  end

  def call
    calculate
  end

  private

  def calculate
    previous_last_range = 0

    SalaryRate::RATES.reduce(0) do |total, (range, tax)|
      if @salary >= range.last
        total += calculate_line(range.last, previous_last_range, tax)
      end

      if range.cover?(@salary)
        total += calculate_line(@salary, previous_last_range, tax)
      end

      previous_last_range = range.last

      total
    end
  end

  def calculate_line(first_value, second_value, tax)
    ((first_value - second_value) * tax).floor
  end
end
