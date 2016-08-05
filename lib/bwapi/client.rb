require 'bwapi/configuration'
require 'bwapi/connection'
require 'bwapi/request'
require 'bwapi/performance'

require 'bwapi/client/admin'
require 'bwapi/client/aggregates'
require 'bwapi/client/author'
require 'bwapi/client/brandwatch'
require 'bwapi/client/client'
require 'bwapi/client/command_center'
require 'bwapi/client/dimensions'
require 'bwapi/client/error_codes'
require 'bwapi/client/filters'
require 'bwapi/client/languages'
require 'bwapi/client/locations'
require 'bwapi/client/logout'
require 'bwapi/client/me'
require 'bwapi/client/metrics'
require 'bwapi/client/oauth'
require 'bwapi/client/ping'
require 'bwapi/client/projects'
require 'bwapi/client/public'
require 'bwapi/client/query_validation'
require 'bwapi/client/sso'
require 'bwapi/client/test_search'
require 'bwapi/client/usage_summary'
require 'bwapi/client/user'

require 'faraday'

module BWAPI
  # Client class to create BWAPI instances
  class Client
    include BWAPI::Configuration
    include BWAPI::Connection
    include BWAPI::Request
    include BWAPI::Performance

    include BWAPI::Client::Admin
    include BWAPI::Client::Aggregates
    include BWAPI::Client::Author
    include BWAPI::Client::Brandwatch
    include BWAPI::Client::Client
    include BWAPI::Client::CommandCenter
    include BWAPI::Client::Dimensions
    include BWAPI::Client::ErrorCodes
    include BWAPI::Client::Filters
    include BWAPI::Client::Languages
    include BWAPI::Client::Locations
    include BWAPI::Client::Logout
    include BWAPI::Client::Me
    include BWAPI::Client::Metrics
    include BWAPI::Client::OAuth
    include BWAPI::Client::Ping
    include BWAPI::Client::Projects
    include BWAPI::Client::Public
    include BWAPI::Client::QueryValidation
    include BWAPI::Client::SSO
    include BWAPI::Client::TestSearch
    include BWAPI::Client::UsageSummary
    include BWAPI::Client::User

    # Initializes Client
    #
    # @params options [Hash] the configuration options
    def initialize(options = {})
      BWAPI::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || BWAPI.instance_variable_get(:"@#{key}"))
      end
    end

    # Check is access token has expired
    #
    # @return [Boolean] access token expiry status
    def access_token_expired?
      return true if @access_token.nil? || @access_token_expiry.nil?
      seconds_until_access_token_expires <= 0
    end

    # Check if user is authenicated
    #
    # @return [Boolean] Authenticated status
    def authenticated?
      (@access_token && !access_token_expired?) ? true : false
    end

    # Check if user is a brandwatch-application-client type
    #
    # @return [Boolean] Application client status
    def application_client?
      @client_id == 'brandwatch-application-client' ? true : false
    end

    # Check if user is a brandwatch-api-client type
    #
    # @return [Boolean] Application client status
    def api_client?
      @client_id == 'brandwatch-api-client' ? true : false
    end

    # Check if user is a brandwatch-api-superadmin-client type
    #
    # @return [Boolean] Application client status
    def api_super_admin_client?
      @client_id == 'brandwatch-api-superadmin-client' ? true : false
    end

    def access_token=(value)
      reset_connection
      @access_token = value
    end

    def api_endpoint=(value)
      reset_connection
      @api_endpoint = value
    end

    def connection_options=(value)
      reset_connection
      @connection_options = value
    end

    def debug=(value)
      reset_connection
      @debug = value
    end

    def logger=(value)
      reset_connection
      @logger = value
    end

    def verify_ssl=(value)
      reset_connection
      @verify_ssl = value
    end

    private

    # Returns the number of seconds until the access token expires
    #
    # @return [Integer] seconds until expiry
    def seconds_until_access_token_expires
      DateTime.parse(@access_token_expiry).to_time.to_i - Time.now.to_i
    end
  end
end
