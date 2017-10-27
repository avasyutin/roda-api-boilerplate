# frozen_string_literal: true

DB = Sequel.connect(ENV.delete('DATABASE_URL'), max_connections: ENV['POOL_SIZE'])
