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

  describe 'POST /create' do
    subject(:create_subject) { post employees_path, params: params }

    context 'with valid params' do
      let(:params) do
        {
          employee: {
            name: 'Dyan',
            cpf: '86094872029',
            personal_phone: '54999971994',
            reference_phone: '54999971995',
            birthdate: '26/05/1993',
            salary: '3.000,00',
            social_security_discount: '281,62',
            street_name: 'Rua do comercio',
            street_number: '123',
            district: 'Centro',
            city: 'Ibiaca',
            state: 'RS',
            zipcode: '99940000'
          }
        }
      end

      it 'creates a new Employee', :perform_sidekiq_jobs do
        expect { create_subject }.to change { Employee.count }.by(1)
      end

      it 'creates a new Employee with the correct data', :perform_sidekiq_jobs do
        create_subject
        employee = Employee.last
        expect(employee.salary_cents).to eq 300000
        expect(employee.social_security_discount_cents).to eq 28162
        expect(employee.salary_currency).to eq 'BRL'
        expect(employee.salary.format).to eq 'R$3.000,00'
        expect(employee.birthdate.to_fs).to eq '26/05/1993'
      end
    end

    context 'with invalid params' do
      let(:params) { { employee: { name: '' } } }

      it 'does not creates a Employee' do
        expect { create_subject }.to change { Employee.count }.by(0)
      end
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
