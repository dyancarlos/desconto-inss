require 'rails_helper'

RSpec.describe EmployeeDiscountsController, type: :request do
  before do
    login_as(build(:user))
  end

  describe "GET /show" do
    it 'renders a json with the discount' do
      get employee_discounts_path(salary: '1.000,00', format: :json)
      expect(JSON.parse(body)).to eq({ "discount" => "R$75,00" })
    end

    it 'renders a json with the discount while missing dot salary format' do
      get employee_discounts_path(salary: '1000,00', format: :json)
      expect(JSON.parse(body)).to eq({ "discount" => "R$75,00" })
    end

    it 'renders a json with the discount while non-numeric salary format' do
      get employee_discounts_path(salary: '10abc00', format: :json)
      expect(JSON.parse(body)).to eq({ "discount" => "R$75,00" })
    end
  end
end
