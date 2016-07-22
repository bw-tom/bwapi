module BWAPI
  class Client
    module Admin
      # Integrations module for admin/integrations endpoints
      module Integrations
        # Get all jwt integrations
        #
        # @param opts [Hash] options hash of parameters
        # @option opts [Integer] page Page of results to retrieve
        # @option opts [Integer] pageSize Results per page of results
        # @return [Hash] All research projects
        def get_jwt_integrations(opts = {})
          get 'admin/integrations/jwt', opts
        end

        # Create new jwt integration
        #
        # @return [Hash] New jwt integration
        def create_jwt_integration(opts = {})
          post 'admin/integrations/jwt', opts
        end
      end
    end
  end
end
