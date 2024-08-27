Faker::Config.locale = 'pt-BR'
FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    cpf { CPF.generate }
    birthdate { Faker::Date.birthday }
    personal_phone { Faker::PhoneNumber.cell_phone }
    reference_phone { Faker::PhoneNumber.cell_phone }
    salary_cents { rand(700000) }
    street_name { Faker::Address.street_name }
    street_number { rand(10000) }
    district { 'Center' }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip }

    trait :with_discount_calculation do
      after(:create) do |employee|
        discount_cents = Employees::CalculateDiscountService.new(employee.salary_cents).call
        employee.update(
          social_security_discount_cents: discount_cents,
          net_salary_cents: employee.salary_cents - discount_cents
        )
      end
    end
  end
end
