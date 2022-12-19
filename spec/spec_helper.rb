# frozen_string_literal: true

require 'numary_client'
require 'webmock/rspec'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    NumaryClient.configuration.host = 'http://localhost:3068'
  end

  config.after do
    NumaryClient.configuration.host = nil
  end
end
