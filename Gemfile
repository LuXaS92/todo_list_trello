source "https://rubygems.org"

gem "rails", "~> 7.2.1", ">= 7.2.1.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"


gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false
gem "sassc-rails"
gem "bootstrap", "~> 5.2.0"
gem "jquery-rails"
gem 'zeitwerk', '~> 2.7.1'



group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "brakeman", require: false

  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
