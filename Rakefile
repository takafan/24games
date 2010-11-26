require 'rake/clean'
require 'rake/testtask'
require 'rspec/core/rake_task'

namespace :spec do
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:examples) do |task|
    task.pattern = 'spec/*_spec.rb'
  end
end

task :default  => "spec:examples"
