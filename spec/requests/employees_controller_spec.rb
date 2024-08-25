require 'rails_helper'

RSpec.describe EmployeesController, type: :request do
  before do
    login_as(build(:user))
  end

  describe "GET /index" do
    before { create(:employee) }

    it 'renders a successful response' do
      get employees_url
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    let!(:employee) { create(:employee) }

    subject(:delete_employee) { delete employee_path(employee) }

    it 'destroys the requested employee' do
      expect { delete_employee }.to change { Employee.count }.by(-1)
    end

    it 'redirects to the employees list' do
      delete_employee
      expect(response).to redirect_to(employees_path)
    end
  end
end
