# frozen_string_literal: true

env = ENV['RACK_ENV'] || 'development'
is_dev = env == 'development'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, env)

Unreloader = Rack::Unreloader.new(subclasses: 'Roda', reload: is_dev) { RodaApiBoilerplate }
Unreloader.require('./roda_api_boilerplate.rb')
