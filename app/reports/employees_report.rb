class EmployeesReport
  class << self
    def employees_by_rate
      SalaryRate::RATES.keys.each_with_object({}) do |range, hash|
        hash[header(range)] = Employee.where(salary_cents: range.first..range.last).count
      end
    end

    private

    def header(range)
      header = I18n.t("common.from")
      header += Money.from_cents(range.first).format
      header += I18n.t("common.to")
      header += Money.from_cents(range.last).format
    end
  end
end
