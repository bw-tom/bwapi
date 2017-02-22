require 'simplecov'

SimpleCov.start do
  add_filter 'lib/bwapi/client/*'
end

require 'bwapi'

RSpec.configure do |config|
  config.color = true
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end
