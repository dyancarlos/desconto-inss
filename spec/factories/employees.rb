Faker::Config.locale = 'pt-BR'
FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    cpf { CPF.generate }
    birthdate { Faker::Date.birthday }
    personal_phone { Faker::PhoneNumber.cell_phone }
    reference_phone { Faker::PhoneNumber.cell_phone }
    salary_cents { 500000 }
    social_security_discount_cents { 10000 }
    street_name { Faker::Address.street_name }
    street_number { Faker::Address.building_number }
    district { 'Center' }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip }
  end
end
