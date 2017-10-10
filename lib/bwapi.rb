require 'bwapi/client'
require 'bwapi/default'

# Ruby wrapper for the Brandwatch API
module BWAPI
  class << self
    include BWAPI::Configuration

    # Alias for BWAPI::Client.new
    #
    # @return [BWAPI::Client]
    def new(opts = {})
      BWAPI::Client.new(opts)
    end

    # Check BWAPI::Client.new responds
    def respond_to_missing?(method_name, include_private = false)
      new.respond_to?(method_name, include_private) || super
    end

    private

    # Delegate to BWAPI::Client.new
    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      new.send(method_name, *args, &block)
    end
  end
end

BWAPI.reset
