FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    cpf { '15892023095' }
    birthdate { '1993-05-26' }
    personal_phone { '54999971994' }
    salary { 500000 }
    social_security_discount { 10000 }
    street_name { Faker::Address.street_name }
    street_number { Faker::Address.building_number }
    district { 'Center' }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip }
  end
end
