require 'bwapi/client/user/facebook'
require 'bwapi/client/user/instagram_credentials'
require 'bwapi/client/user/notifications'
require 'bwapi/client/user/twitter_credentials'

module BWAPI
  class Client
    # User module for user endpoints and helper methods
    module User
      # Get the current user
      #
      # @return [Hash] User information
      def user
        get 'user'
      end

      # Update the current user
      #
      # @param opts [Hash] options Hash of parameters
      # @option opts [Integer] id Id of the user
      # @option opts [Hash] tags The users assigned tags
      # @option opts [String] passwordConfirmation The confirmed password
      # @option opts [Boolean] enabled The status of the user
      # @option opts [String] lastName The last name of the user
      # @option opts [String] phone The users phone number
      # @option opts [String] department The users department
      # @option opts [String] job The users job
      # @option opts [String] messenger The users IM details
      # @option opts [String] password The password of the user
      # @option opts [Integer] clientId The users client id
      # @option opts [String] username The users username
      # @option opts [String] address The users address
      # @option opts [String] uiRole The users ui role
      # @option opts [Array] apiRole The users api role
      # @option opts [String] firstName The users first name
      # @option opts [String] mobile The users mobile number
      # @option opts [Date] creationDate Date the user was created on
      # @return [Hash] Updated user information
      def update_user(opts = {})
        put 'user', opts
      end

      # Change password
      #
      # TODO: Add parameters documentation
      def change_password(opts = {})
        put '/user/changePassword', opts
      end

      # Reset password for user
      #
      # TODO: Add parameters documentation
      def reset_password(opts = {})
        post '/user/resetPassword', opts
      end

      # Send reset password email
      #
      # TODO: Add parameters documentation
      def send_reset_password_email(opts = {})
        post '/user/sendResetPasswordEmail', opts
      end

      # Generate 2FA key for the current user
      #
      # TODO: Add parameters documentation
      def generate_two_factor_auth(opts = {})
        post '/user/generateTwoFactorAuthKey', opts
      end

      # Enable 2FA for current user
      #
      # TODO: Add parameters documentation
      def enable_two_factor_auth(opts = {})
        post '/user/enableTwoFactorAuth', opts
      end

      # Verify OTP code
      #
      # TODO: Add parameters documentation
      def verify_code(opts = {})
        get '/user/verifyCode', opts
      end

      # Send authentication code
      #
      # TODO: Add parameters documentation
      def send_code(opts = {})
        post '/user/sendCode', opts
      end

      # Get Spredfast integration for current user
      #
      # TODO: Add parameters documentation
      def user_spredfast
        get '/user/spredfast'
      end

      # Get users api role
      #
      # @return [String] Users api role
      def api_role
        user.apiRole
      end

      # Get users ui role
      #
      # @return [String] Users ui role
      def ui_role
        user.uiRole
      end

      include BWAPI::Client::User::Facebook
      include BWAPI::Client::User::InstagramCredentials
      include BWAPI::Client::User::Notifications
      include BWAPI::Client::User::TwitterCredentials
    end
  end
end
