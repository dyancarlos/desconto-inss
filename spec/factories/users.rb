FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end
