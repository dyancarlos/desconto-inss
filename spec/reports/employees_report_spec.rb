require 'rails_helper'

RSpec.describe EmployeesReport, type: :report do
  before do
    create(:employee, salary: '100,00')
    create(:employee, salary: '1000,00')
    create(:employee, salary: '1030,00')
    create(:employee, salary: '2100,00')
    create(:employee, salary: '2400,00')
    create(:employee, salary: '2900,00')
    create(:employee, salary: '3000,00')
    create(:employee, salary: '5000,00')
  end

  it 'returns employees data in the correct format' do
    expect(EmployeesReport.employees_by_rate).to eq(
      {
        "De R$0,00 até R$1.045,00" => 3,
        "De R$1.045,01 até R$2.089,60" => 0,
        "De R$2.089,61 até R$3.134,40" => 4,
        "De R$3.134,41 até R$6.101,06" => 1
      }
    )
  end
end
