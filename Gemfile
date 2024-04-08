# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'active_model_serializers'
gem 'aws-sdk-s3'
gem 'bootsnap', require: false
gem 'devise'
gem 'devise-jwt'
gem 'kaminari'
gem 'puma', '>= 5.0'
gem 'pundit'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'annotate'
  gem 'brakeman'
  gem 'bullet'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
