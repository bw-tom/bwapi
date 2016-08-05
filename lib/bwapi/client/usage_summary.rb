module BWAPI
  class Client
    # UsageSummary module for usageSummary endpoints
    module UsageSummary
      # Requests reseller usage summaries
      #
      # TODO: Add parameters documentation
      def reseller_usage_summary(opts = {})
        get 'reseller/usageSummary', opts
      end

      # Requests reseller usage summaries for a specific client
      #
      # TODO: Add parameters documentation
      def reseller_client_usage_summary(client_id)
        get "reseller/usageSummary/#{client_id}"
      end
    end
  end
end
