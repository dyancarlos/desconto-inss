source "https://rubygems.org"

gem "rails", "~> 7.2.0"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "devise"
gem "puma", ">= 5.0"
gem "haml-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "sidekiq"
gem "kaminari"
gem "bootsnap", require: false
gem "bootstrap", "~> 5.3.3"
gem "sassc-rails"

group :tools do
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rubocop-rspec", require: false
end

group :development, :test do
  gem "brakeman", require: false
  gem "active_record_doctor"
  gem "bullet"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 6.0.2"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
