require 'date'
require File.dirname(__FILE__) + '/lib/bwapi/version'

Gem::Specification.new do |s|
  s.name        = 'bwapi'
  s.version     = BWAPI::VERSION
  s.version     = BWAPI::VERSION + ".pre.#{ENV['BUILD_NUMBER']}" if ENV['PRE_RELEASE']
  s.date        = Date.today.to_s
  s.summary     = 'Brandwatch API Wrapper'
  s.description = 'A Ruby wrapper for the Brandwatch API'
  s.author      = `git log --all --format='%aN' | sort -u`.split("\n")
  s.email       = 'automation@brandwatch.com'
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/BrandwatchLtd/bwapi'
  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rubocop', '~> 0.34.2'
  s.add_development_dependency 'yard', '~> 0.9.0'
  s.add_development_dependency 'geminabox', '~> 0.13.1'

  s.add_runtime_dependency 'allotment', '~> 1.1'
  s.add_runtime_dependency 'faraday', '~> 0.9'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.9'
  s.add_runtime_dependency 'faraday_middleware-parse_csv', '~> 0.1'
  s.add_runtime_dependency 'faraday_middleware-parse_oj', '~> 0.3'
  s.add_runtime_dependency 'oj', '~> 2.11'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
end
