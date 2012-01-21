require 'bundler/gem_tasks'
require 'rdoc/task'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new do |t|
    t.verbose = false
  end
rescue LoadError
  # ignore
end

RDoc::Task.new do |t|
  t.main = 'README.rdoc'
  t.rdoc_files.include('README.rdoc', 'lib/**/*.rb')
end
