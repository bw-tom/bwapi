module BWAPI
  # Configuration module
  module Configuration
    attr_accessor :access_token, :access_token_expiry, :adapter, :api_endpoint, :client_id, :debug,
                  :grant_type, :logger, :open_timeout, :performance, :refresh_token, :timeout,
                  :user_agent, :username, :verify_ssl

    attr_writer :client_secret, :password

    class << self
      # Configuration keys
      def keys
        @keys ||= [
          :access_token,
          :access_token_expiry,
          :adapter,
          :api_endpoint,
          :client_id,
          :client_secret,
          :connection_options,
          :debug,
          :grant_type,
          :logger,
          :open_timeout,
          :password,
          :performance,
          :refresh_token,
          :timeout,
          :user_agent,
          :username,
          :verify_ssl
        ]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    def reset
      BWAPI::Configuration.keys.each { |key| instance_variable_set(:"@#{key}", BWAPI::Default.options[key]) }
      self
    end

    def destroy
      BWAPI::Configuration.keys.each { |key| instance_variable_set(:"@#{key}", nil) }
      self
    end

    private

    attr_reader :client_secret, :password

    def options
      Hash[BWAPI::Configuration.keys.map { |key| [key, instance_variable_get(:"@#{key}")] }]
    end
  end
end
