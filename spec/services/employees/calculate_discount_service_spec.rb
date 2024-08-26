require 'rails_helper'

RSpec.describe Employees::CalculateDiscountService, type: :service do
  it 'calculates the discount for the first line salary' do
    calculator = Employees::CalculateDiscountService.new(10000).call
    expect(calculator).to eq 750
  end

  it 'calculates the discount for the second line salary' do
    calculator = Employees::CalculateDiscountService.new(200000).call
    expect(calculator).to eq 16432
  end

  it 'calculates the discount for the third line salary' do
    calculator = Employees::CalculateDiscountService.new(300000).call
    expect(calculator).to eq 28162
  end

  it 'calculates the discount for the fourth line salary' do
    calculator = Employees::CalculateDiscountService.new(400000).call
    expect(calculator).to eq 41893
  end

  it 'calculates the discount for the out of line salary' do
    calculator = Employees::CalculateDiscountService.new(700000).call
    expect(calculator).to eq 71308
  end
end
