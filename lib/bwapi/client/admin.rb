require 'bwapi/client/admin/become'
require 'bwapi/client/admin/clients'
require 'bwapi/client/admin/demographics'
require 'bwapi/client/admin/integrations'
require 'bwapi/client/admin/reseller'
require 'bwapi/client/admin/search'
require 'bwapi/client/admin/client'
require 'bwapi/client/admin/pricing_upgrades'
require 'bwapi/client/admin/projects'

module BWAPI
  class Client
    # Admin module for admin endpoints
    module Admin
      # Get the active queries irrespective of project
      #
      # @param opts [Hash] options hash of parameters
      # @option opts [Integer] page Page of projects to retrieve
      # @option opts [Integer] pageSize Results per page of results
      # @option opts [Integer] sortBy Filter to sort queries by
      # @return [Hash] All active queries
      def active_queries(opts = {})
        get 'admin/activequeries', opts
      end

      # Get the project report of sharing details
      #
      # @return [Hash] Project sharing report
      def sharing_report
        get 'admin/sharing-report'
      end

      include BWAPI::Client::Admin::Become
      include BWAPI::Client::Admin::Clients
      include BWAPI::Client::Admin::Client
      include BWAPI::Client::Admin::Demographics
      include BWAPI::Client::Admin::Integrations
      include BWAPI::Client::Admin::Reseller
      include BWAPI::Client::Admin::Search
      include BWAPI::Client::Admin::PricingUpgrades
      include BWAPI::Client::Admin::Projects
    end
  end
end
