require 'bwapi/response/error'
require 'bwapi/response/logger'
require 'bwapi/response/performance'
require 'faraday_middleware'
require 'faraday_middleware/parse_csv'
require 'faraday_middleware/parse_oj'

module BWAPI
  # Connection module
  module Connection
    RACK_BUILDER_CLASS = defined?(Faraday::RackBuilder) ? Faraday::RackBuilder : Faraday::Builder

    private

    def connection
      @connection ||= Faraday.new(faraday_options)
    end

    def reset_connection
      @connection = nil
    end

    def faraday_options
      opts                           = @connection_options
      opts[:headers][:authorization] = "bearer #{@access_token}" if @access_token
      opts[:builder]                 = middleware
      opts[:ssl]                     = { verify: @verify_ssl }
      opts[:request][:timeout]       = @timeout
      opts[:request][:open_timeout]  = @open_timeout
      opts[:url]                     = @api_endpoint
      opts
    end

    def middleware
      RACK_BUILDER_CLASS.new do |builder|
        builder.request :json

        builder.use BWAPI::Response::Performance, self if debug
        builder.use BWAPI::Response::Error
        builder.use BWAPI::Response::Logger, self if debug

        builder.response :oj
        builder.response :csv, parser: { encoding: 'bom|utf-8' }
        builder.response :follow_redirects
        builder.adapter Faraday.default_adapter
      end
    end
  end
end
