# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'rack-unreloader'
gem 'rake'
gem 'roda'

group :development do
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry-byebug', require: 'pry'
  gem 'rspec'
end

group :test do
  gem 'rack-test'
  gem 'simplecov', require: false
end
