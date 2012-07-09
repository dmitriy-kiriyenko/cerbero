#!/usr/bin/env rake

require 'rubygems'
require 'bundler/setup'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
end

namespace :db do
  task :create do
    case ENV['DB']
    when 'mysql'
      system "mysql -uroot -e 'drop database cerbero_test; create database cerbero_test;'"
    when 'postgres'
      system "`psql -c 'drop database cerbero_test;' -U postgres`"
      system "`psql -c 'create database cerbero_test;' -U postgres`"
    end
  end
end
