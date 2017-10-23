# frozen_string_literal: true

desc 'Start REPL session (short-cut alias: "c")'
task :console do
  ENV['RACK_ENV'] ||= ARGV[1] || 'development'

  require_relative './boot'

  if defined?(Pry)
    Pry.start
  else
    require 'irb'
    ARGV.clear
    IRB.start
  end
end

task c: :console
task pry: :console
