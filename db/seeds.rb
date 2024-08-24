require 'factory_bot_rails'

puts '---------> Creating User'
user = FactoryBot.create(
  :user,
  email: 'admin@email.com',
  password: 'secret',
  password_confirmation: 'secret'
)
