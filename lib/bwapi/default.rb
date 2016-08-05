require 'bwapi/version'
require 'bwapi/configuration'

require 'allotment'
require 'faraday'

module BWAPI
  # Default module
  module Default
    ADAPTER      = Faraday.default_adapter

    API_ENDPOINT = 'https://newapi.brandwatch.com/'.freeze

    CLIENT_ID    = 'brandwatch-api-client'.freeze

    GRANT_TYPE   = 'api-password'.freeze

    USER_AGENT   = "BWAPI Ruby Gem #{BWAPI::VERSION}".freeze

    class << self
      def options
        Hash[BWAPI::Configuration.keys.map { |key| [key, send(key)] }]
      end

      def access_token
        ENV['BWAPI_ACCESS_TOKEN']
      end

      def access_token_expiry
        nil
      end

      def adapter
        ENV['BWAPI_ADAPTER'].is_a?(String) ? ENV['BWAPI_ADAPTER'].to_sym : ADAPTER
      end

      def api_endpoint
        ENV['BWAPI_API_ENDPOINT'] || API_ENDPOINT
      end

      def client_id
        ENV['BWAPI_CLIENT_ID'] || CLIENT_ID
      end

      def client_secret
        ENV['BWAPI_CLIENT_SECRET']
      end

      def connection_options
        {
          headers: {
            user_agent: user_agent
          },
          request: {
            params_encoder: Faraday::FlatParamsEncoder
          }
        }
      end

      def debug
        ENV['BWAPI_DEBUG'] == 'true' ? true : false
      end

      def grant_type
        ENV['BWAPI_GRANT_TYPE'] || GRANT_TYPE
      end

      def logger
        nil
      end

      def open_timeout
        ENV['OPEN_TIMEOUT'] || 30
      end

      def password
        ENV['BWAPI_PASSWORD']
      end

      def performance
        Allotment.results
      end

      def refresh_token
        ENV['BWAPI_REFRESH_TOKEN']
      end

      def timeout
        ENV['TIMEOUT'] || 60
      end

      def user_agent
        ENV['BWAPI_USER_AGENT'] || USER_AGENT
      end

      def username
        ENV['BWAPI_USERNAME']
      end

      def verify_ssl
        ENV['BWAPI_VERIFY_SSL'] == 'true' ? true : false
      end
    end
  end
end
