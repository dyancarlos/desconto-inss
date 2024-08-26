class Employees::CalculateDiscountService
  DISCOUNT_RATES = {
    (0..104500)      => 0.075,
    (104501..208960) => 0.09,
    (208961..313440) => 0.12,
    (313441..610106) => 0.14
  }

  def initialize(salary)
    @salary = salary
  end

  def call
    calculate
  end

  private

  def calculate
    previous_last_range = 0

    DISCOUNT_RATES.reduce(0) do |total, (range, tax)|
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
