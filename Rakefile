# frozen_string_literal: true

task :environment do
  ENV['RACK_ENV'] ||= ARGV[1] || 'development'
  ARGV.clear

  require_relative './boot'
end

desc 'Start REPL session (short-cut alias: "c")'
task console: :environment do
  if defined?(Pry)
    Pry.start
  else
    require 'irb'
    IRB.start
  end

  exit!(0)
end

task c: :console
task pry: :console

Dir.glob('./lib/tasks/**/*.rake').each { |task| load(task) }
