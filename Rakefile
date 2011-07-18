require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rdoc/task'

RSpec::Core::RakeTask.new do |t|
  t.verbose = false
end

RDoc::Task.new do |t|
  t.main = 'README.rdoc'
  t.rdoc_files.include('README.rdoc', 'lib/**/*.rb')
end
