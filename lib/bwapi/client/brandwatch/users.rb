module BWAPI
  class Client
    module Brandwatch
      # users_details module for brandwatch/users/details endpoint
      module Users
        # Returns the specified users details
        #
        # @param opts [Hash] options hash of parameters
        # @option opts [String] username of the user
        # @return [Hash] Returns the user DTO
        def brandwatch_users_details(opts = {})
          get 'brandwatch/users/details', opts
        end
      end
    end
  end
end
