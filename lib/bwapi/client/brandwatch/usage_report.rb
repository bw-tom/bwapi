module BWAPI
  class Client
    module Brandwatch
      # usageReport module for brandwatch/usageReport endpoint
      module UsageReport
        # Get the Clients Mention Usage report
        #
        # @param client_id [Integer] Id of client
        # @param start_date [DateTime] Report startDate
        # @param end_date [DateTime] Report endDate
        # @param opts [Hash] options hash of parameters
        # @return [Hash] Returns usage report for active client
        def brandwatch_usage_report(client_id, start_date, end_date, opts = {})
          get "brandwatch/usageReport/client/#{client_id}/start/#{start_date}/end/#{end_date}", opts
        end
      end
    end
  end
end
