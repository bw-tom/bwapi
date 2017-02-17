module BWAPI
  class Client
    module Brandwatch
      module Clients
        # Login module for the brandwatch/clients/login/report endpoint
        module Login
          # This endpoint is for users to pull login reports for clients
          def brandwatch_login_report(client_id, opts = {})
            get "brandwatch/clients/#{client_id}/login/report", opts
          end
        end
      end
    end
  end
end
