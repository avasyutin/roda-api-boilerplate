# frozen_string_literal: true

namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |_t, args|
    require 'sequel'
    require 'dotenv'

    env = ENV['RACK_ENV'] || 'development'
    Dotenv.load(['.env', env].compact.join('.'), '.env')

    Sequel.extension(:migration)
    db = Sequel.connect(ENV.fetch('DATABASE_URL'))

    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, 'db/migrations', target: args[:version].to_i)
    else
      puts 'Migrating to latest'
      Sequel::Migrator.run(db, 'db/migrations')
    end
  end
end
