require 'bwapi/client/brandwatch/clients/command_center'
require 'bwapi/client/brandwatch/clients/users'
require 'bwapi/client/brandwatch/clients/modules'

module BWAPI
  class Client
    module Brandwatch
      # Clients module for brandwatch/clients endpoints
      module Clients
        # Get specific clients
        #
        # @param opts [Hash] options Hash of parameters
        # @options opts [String] nameContains Client name search (case insensitive)
        # @return [Hash] List of filtered clients
        def brandwatch_clients(opts = {})
          get 'brandwatch/clients', opts
        end

        # Create a new parent client
        #
        # @param opts [Hash] options Hash of parameters
        # @option opts [String] address1 Address line one of the client
        # @option opts [String] address2 Address line two of the client
        # @option opts [String] address3 Address line three of the client
        # @option opts [String] contactEmail The contact email for the client
        # @option opts [String] contactMobile The mobile number for the client
        # @option opts [String] contactName The contact name of the client
        # @option opts [String] contactTelephone Telephone number of the client
        # @option opts [String] contactTitle Contact title of the client
        # @option opts [String] country The country of the client
        # @option opts [Date] expiryDate The expiry date for the client
        # @option opts [Integer] id Id of the client
        # @option opts [Boolean] isLegacy Legacy status of the client
        # @option opts [Integer] maxUsers Maxiumum number of users for the client
        # @option opts [Integer] maximumSubscribedBrands The maximum subscribed brands for the client
        # @option opts [Integer] mentionArchiveSize Mention archive size for the client
        # @option opts [Integer] mentionBasedPricingMatrixLevel The amount of mentions allowed
        # @option opts [String] name Name of the client
        # @option opts [String] owner Owner of client
        # @option opts [Integer] parentId clients parent Client (subclients only)
        # @option opts [String] postcode The postcode of the client
        # @option opts [Integer] priceStructureId Id of the price structure for client
        # @option opts [Integer] priceStructureLineId The level of the price structure for the client
        # @option opts [String] pricingModel Pricing model of the client
        # @option opts [Date] startDate Start date of the client
        # @option opts [Hash] tags Tags for the client
        # @option opts [String] theme The theme of the client
        # @option opts [String] website The website for the client
        # @return [Hash] Newly created parent client
        def brandwatch_create_client(opts = {})
          post 'brandwatch/clients', opts
        end

        # Get specific client
        #
        # @param client_id [Integer] Id of the client
        # @return [Hash] Specific client
        def brandwatch_get_client(client_id)
          get "brandwatch/clients/#{client_id}"
        end

        # Update an existing parent client
        #
        # @param client_id [Integer] Id of the client
        # @param opts [Hash] options Hash of parameters
        # @option opts [String] address1 Address line one of the client
        # @option opts [String] address2 Address line two of the client
        # @option opts [String] address3 Address line three of the client
        # @option opts [String] contactEmail The contact email for the client
        # @option opts [String] contactMobile The mobile number for the client
        # @option opts [String] contactName The contact name of the client
        # @option opts [String] contactTelephone Telephone number of the client
        # @option opts [String] contactTitle Contact title of the client
        # @option opts [String] country The country of the client
        # @option opts [Date] expiryDate The expiry date for the client
        # @option opts [Integer] id Id of the client
        # @option opts [Boolean] isLegacy Legacy status of the client
        # @option opts [Integer] maxUsers Maxiumum number of users for the client
        # @option opts [Integer] maximumSubscribedBrands The maximum subscribed brands for the client
        # @option opts [Integer] mentionArchiveSize Mention archive size for the client
        # @option opts [Integer] mentionBasedPricingMatrixLevel The amount of mentions allowed
        # @option opts [String] name Name of the client
        # @option opts [String] owner Owner of client
        # @option opts [Integer] parentId clients parent Client (subclients only)
        # @option opts [String] postcode The postcode of the client
        # @option opts [Integer] priceStructureId Id of the price structure for client
        # @option opts [Integer] priceStructureLineId The level of the price structure for the client
        # @option opts [String] pricingModel Pricing model of the client
        # @option opts [Date] startDate Start date of the client
        # @option opts [Hash] tags Tags for the client
        # @option opts [String] theme The theme of the client
        # @option opts [String] website The website for the client
        # @return [Hash] Updated parent client
        def brandwatch_update_client(client_id, opts = {})
          put "brandwatch/clients/#{client_id}", opts
        end

        include BWAPI::Client::Brandwatch::Clients::CommandCenter
        include BWAPI::Client::Brandwatch::Clients::Users
        include BWAPI::Client::Brandwatch::Clients::Modules
      end
    end
  end
end
