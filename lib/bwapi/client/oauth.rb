module BWAPI
  class Client
    # OAuth module for oauth/token endpoint
    module OAuth
      # Authenticate a user
      #
      # @param opts [Hash] options hash of parameters
      # @option opts [String] username User name of user
      # @option opts [String] password Password of the user
      # @option opts [String] grant_type Grant type of user
      # @option opts [String] client_secret Client secret
      # @option opts [String] client_id Client id
      # @option opts [String] force_urlencoded Force urlencoded
      def oauth_token(opts = {})
        opts = {
          username: username,
          password: password,
          grant_type: determine_grant_type,
          client_secret: client_secret,
          client_id: client_id,
          force_urlencoded: true
        }.merge opts

        oauth_request opts
      end
      alias login oauth_token

      # Refresh a authenticated users oauth_token
      #
      # @param opts [Hash] options hash of parameters
      # @option opts [String] username User name of user
      # @option opts [String] password Password of the user
      # @option opts [String] grant_type Grant type of user
      # @option opts [String] refresh_token Users refresh token
      # @option opts [String] client_id Client id
      # @option opts [String] force_urlencoded Force urlencoded
      def oauth_refresh_token(opts = {})
        opts = {
          username: username,
          password: password,
          refresh_token: refresh_token,
          grant_type: 'refresh_token',
          client_id: client_id,
          force_urlencoded: true
        }.merge opts

        oauth_request opts
      end
      alias refresh oauth_refresh_token

      # Determines grant-type used for client
      #
      # @return [String] relevant grant type for client
      def determine_grant_type
        return grant_type unless grant_type.nil?
        api_client? ? 'api-password' : 'password'
      end

      # Sends a oauth request
      #
      # @param opts [Hash] options hash of parameters
      def oauth_request(opts = {})
        response = post('oauth/token', opts)
        self.access_token = response['access_token']
        self.access_token_expiry = Time.at(Time.now.to_i + response['expires_in']).iso8601
        self.refresh_token = response['refresh_token'] if application_client?
        response
      end
    end
  end
end
