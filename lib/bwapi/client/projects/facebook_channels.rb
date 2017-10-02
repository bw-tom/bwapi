module BWAPI
  class Client
    module Projects
      # FacebookChannels module for projects/facebookchannels endpoints
      module FacebookChannels
        # Get all facebook channels in a project
        #
        # @param project_id [Integer] Id of project
        # @return [Hash] All facebook channels in project
        def facebook_channels(project_id)
          get "projects/#{project_id}/facebookchannels"
        end

        # Get a specific facebook channel in a project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of facebook channel
        # @return [Hash] Specific facebook query
        def get_facebook_channel(project_id, query_id)
          get "projects/#{project_id}/facebookchannels/#{query_id}"
        end

        # Create a facebook channel in a project
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [Integer] id Id of the query
        # @option opts [String] name Name of the query
        # @option opts [Integer] averageMonthlyMentions Average monthly mentions
        # @option opts [Array] contextTerms Content terms of the query
        # @option opts [Array] excludedTerms Excluded terms of thequery
        # @option opts [Array] includedTerms Included terms of terms query
        # @option opts [Date] creationDate Date the query was created on
        # @option opts [Integer] dailyLimit Daily limit of the query
        # @option opts [Boolean] isOwned Does client claim ownedship of page
        # @option opts [Integer] facebookPageId Id of the facebook page
        # @option opts [String] facebookPageName Name of the facebook page
        # @option opts [String] industry Industry of the query
        # @option opts [Array] languages Query languages set
        # @option opts [Date] lastModificationDate Last modification date of the query
        # @option opts [String] type Query type
        # @return [Hash] New facebook query
        def create_facebook_channel(project_id, opts = {})
          post "projects/#{project_id}/facebookchannels", opts
        end

        # Update an existing facebook channel in a project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of query
        # @param opts [Hash] options hash of parameters
        # @option opts [Integer] id Id of the query
        # @option opts [String] name Name of the query
        # @option opts [Integer] averageMonthlyMentions Average monthly mentions
        # @option opts [Array] contextTerms Content terms of the query
        # @option opts [Array] excludedTerms Excluded terms of thequery
        # @option opts [Array] includedTerms Included terms of terms query
        # @option opts [Date] creationDate Date the query was created on
        # @option opts [Integer] dailyLimit Daily limit of the query
        # @option opts [Boolean] isOwned Does client claim ownedship of page
        # @option opts [Integer] facebookPageId Id of the facebook page
        # @option opts [String] facebookPageName Name of the facebook page
        # @option opts [String] industry Industry of the query
        # @option opts [Array] languages Query languages set
        # @option opts [Date] lastModificationDate Last modification date of the query
        # @option opts [String] type Query type
        # @return [Hash] Updated facebook query
        def update_facebook_channel(project_id, query_id, opts = {})
          put "projects/#{project_id}/facebookchannels/#{query_id}", opts
        end

        # Delete a Facebook channel
        #
        # TODO: Add parameters documentation
        def delete_facebook_channel(project_id, query_id)
          delete "/projects/#{project_id}/facebookchannels/#{query_id}"
        end
      end
    end
  end
end
