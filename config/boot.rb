# frozen_string_literal: true

env = ENV['RACK_ENV'] || 'development'
is_dev = env == 'development'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, env)

Dotenv.load(['.env', env].compact.join('.'), '.env')

Unreloader = Rack::Unreloader.new(subclasses: %w['Roda Sequel::Model'], reload: is_dev) { RodaApiBoilerplate }
Unreloader.require('./config/roda_api_boilerplate.rb')

require_relative 'models'
