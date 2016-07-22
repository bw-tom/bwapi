require 'rake'
require 'bundler'
Bundler.setup

require 'yard'
YARD::Rake::YardocTask.new do |t|
  t.files = ['lib/**/*.rb', 'lib/**/**/*.rb']
  t.options = %w(--list-undoc)
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.formatters = ['progress']
  task.patterns   = ['lib/**/*.rb']
end

desc 'Build the gem locally'
task :build do
  system 'gem build bwapi.gemspec'
end

desc 'Install the gem locally'
task :install do
  system 'gem install bwapi-*.gem'
end

desc 'Build and release the gem to argus'
task release: :build do
  system 'gem inabox bwapi-*.gem'
end

desc 'Release a pre release of the gem'
task :pre_release do
  ENV['PRE_RELEASE'] = 'true'
  system 'gem build *.gemspec'
  system 'gem inabox *.gem'
end

desc 'Running rubocop'
task :rubocop do
  %w(rubocop)
end

desc 'Runing rspec for the project'
task :spec do
  system 'rspec'
end

task default: %w(rubocop spec)
