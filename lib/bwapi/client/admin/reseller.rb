module BWAPI
  class Client
    module Admin
      # Reseller module for admin/reseller endpoints
      module Reseller
        # Requests reseller usage report
        #
        # TODO: Add parameters documentation
        def reseller_mention_usage_report(opts = {})
          get '/admin/reseller/requestMentionUsageReport', opts
        end

        # Requests reseller client usage report
        #
        # TODO: Add parameters documentation
        def reseller_client_mention_usage_report(client_id, opts = {})
          get "/admin/reseller/requestMentionUsageReport/#{client_id}", opts
        end
      end
    end
  end
end
