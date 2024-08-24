require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'validates name presence' do
    employee = build(:employee, name: '')
    expect(employee).not_to be_valid
  end

  it 'validates birthdate presence' do
    employee = build(:employee, birthdate: '')
    expect(employee).not_to be_valid
  end

  it 'validates cpf incorrect format' do
    employee = build(:employee, cpf: '03371052002')
    expect(employee).not_to be_valid
  end

  it 'validates cpf correct format' do
    employee = build(:employee, cpf: '15892023095')
    expect(employee).to be_valid
  end

  it 'validates phone incorrect format' do
    employee = build(:employee, personal_phone: '123456')
    expect(employee).not_to be_valid
  end

  it 'validates phone from other country' do
    employee = build(:employee, personal_phone: '+5454999971994')
    expect(employee).not_to be_valid
  end
end
