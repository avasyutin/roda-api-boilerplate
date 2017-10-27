# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'dotenv', require: 'dotenv'
gem 'rack-unreloader'
gem 'rake'
gem 'roda'
gem 'sequel', '>= 5'
gem 'sequel_pg', require: 'sequel'

group :development do
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry-byebug', require: 'pry'
  gem 'rspec'
end

group :test do
  gem 'database_cleaner'
  gem 'rack-test'
  gem 'simplecov', require: false
end
