require 'factory_bot_rails'

puts '---------> Creating User'
FactoryBot.create(
  :user,
  email: 'admin@email.com',
  password: 'secret',
  password_confirmation: 'secret'
)

puts '---------> Creating Employees'
FactoryBot.create_list(
  :employee, 10
)
