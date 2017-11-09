# frozen_string_literal: true

unless ENV['SKIP_SIMPLECOV'] == '1'
  require 'simplecov'

  SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter]
  SimpleCov.start do
    add_filter '/spec/'
    add_filter 'boot.rb'
  end
end

ENV['RACK_ENV'] = 'test'

require 'rake'
require 'rack/test'

load 'lib/tasks/db.rake'
Rake::Task['db:migrate'].invoke

require File.expand_path('../../config/boot', __FILE__)

Dir[RodaApiBoilerplate.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include RequestSpecHelpers, type: :request
  config.include(Module.new do
    def app
      RodaApiBoilerplate.freeze.app
    end
  end)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'tmp/examples.txt'
  config.disable_monkey_patching!
  config.warnings = false
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random

  Kernel.srand(config.seed)

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
