require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

# for testing react-rails
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  # nothing to configure
end
