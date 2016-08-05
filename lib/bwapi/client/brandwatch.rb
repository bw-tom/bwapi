require 'bwapi/client/brandwatch/become'
require 'bwapi/client/brandwatch/clients'
require 'bwapi/client/brandwatch/command_center'
require 'bwapi/client/brandwatch/ditto_brands'
require 'bwapi/client/brandwatch/host_location_overrides'
require 'bwapi/client/brandwatch/log_level'
require 'bwapi/client/brandwatch/price_structures'
require 'bwapi/client/brandwatch/usage_report'
require 'bwapi/client/brandwatch/users'

module BWAPI
  class Client
    # Brandwatch module for brandwatch endpoints
    module Brandwatch
      # Create a new data download in project
      #
      # @param project_id [Integer] Id of project
      # @param opts [Hash] options hash of parameters
      # @option opts [Integer] id Id of the data download
      # @option opts [Integer] queryId Id of the query
      # @option opts [Int] percentComplete The percentage complete of data download
      # @option opts [String] status The status of the download
      # @option opts [String] queryName The query name of the data download
      # @option opts [Date] endDate The end date of the data download
      # @option opts [Date] requestDate The request date of the data download
      # @option opts [String] downloadLinkXLS The link to download the XLS format
      # @option opts [String] downloadLinkCSV The link to download the CSV format
      # @option opts [Array] additionalColumns The additional columns for the data download
      # @return [Hash] New data download
      def brandwatch_data_download(project_id, opts = {})
        post "brandwatch/#{project_id}/datadownload", opts
      end

      # Alter the logging level override for given access token
      #
      # TODO: Add parameters documentation
      def update_token_log_level(opts = {})
        put '/brandwatch/token-log-level', opts
      end

      # Get the logging level override for given access token
      #
      # TODO: Add parameters documentation
      def get_token_log_level(access_token)
        get "/brandwatch/token-log-level/#{access_token}"
      end

      # Remove the logging level override for given access token
      #
      # TODO: Add parameters documentation
      def delete_token_log_level(access_token)
        delete "/brandwatch/token-log-level/#{access_token}"
      end

      include BWAPI::Client::Brandwatch::Become
      include BWAPI::Client::Brandwatch::Clients
      include BWAPI::Client::Brandwatch::CommandCenter
      include BWAPI::Client::Brandwatch::DittoBrands
      include BWAPI::Client::Brandwatch::HostLocationOverrides
      include BWAPI::Client::Brandwatch::LogLevel
      include BWAPI::Client::Brandwatch::PriceStructures
      include BWAPI::Client::Brandwatch::UsageReport
      include BWAPI::Client::Brandwatch::Users
    end
  end
end
