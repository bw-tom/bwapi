module BWAPI
  class Client
    module Projects
      # InstagramQueries module for projects/instagramqueries endpoints
      module InstagramQueries
        # Get all instagram channels in a project
        #
        # @param project_id [Integer] Id of project
        # @return [Hash] All instagram channels in project
        def instagram_channels(project_id)
          get "projects/#{project_id}/instagramqueries"
        end

        # Get a specific facebook query in a project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of instagram channel
        # @return [Hash] Specific instagram channel
        def get_instagram_channel(project_id, query_id)
          get "projects/#{project_id}/instagramqueries/#{query_id}"
        end

        # Create a instagram channel in a project
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [Integer] averageMonthlyMentions Average monthly mentions
        # @option opts [Array] contextTerms Content terms of the channel
        # @option opts [Integer] dailyLimit Daily limit of the channel
        # @option opts [String] description channel description
        # @option opts [Array] excludedTerms Excluded terms of the channel
        # @option opts [Integer] id Id of the channel
        # @option opts [Array] includedTerms Included terms of terms channel
        # @option opts [String] industry Industry of the channel
        # @option opts [String] instagramScreenName Instagram screen name
        # @option opts [String] instagramUserId Instagram user ID
        # @option opts [Boolean] isCreatedByWizard Is wizard channel
        # @option opts [Boolean] isLanguageAgnostic Language agnostic
        # @option opts [Boolean] isLockedQuery Is channel locked
        # @option opts [Set] languages channel language
        # @option opts [Date] lastModificationDate Last modification date
        # @option opts [String] lastModifiedUsername Username of the last user that edited the channel
        # @option opts [String] lockedByUsername User who locked channel
        # @option opts [Date] lockedTime Time channel was locked
        # @option opts [String] name Name of the channel
        # @option opts [Integer] samplePercent Sample percent value
        # @option opts [Integer] twitterLimit Twitter limit
        # @option opts [String] twitterScreenName Tracked Twitter screenname
        # @option opts [String] type Type of channel
        # @option opts [String] instagramAccessToken Instagram access tocken
        # @return [Hash] New Instagram channel
        def create_instagram_channel(project_id, opts = {})
          post "projects/#{project_id}/instagramqueries", opts
        end

        # Update an existing Instagram channels in a project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of query
        # @option opts [Integer] averageMonthlyMentions Average monthly mentions
        # @option opts [Array] contextTerms Content terms of the channel
        # @option opts [Integer] dailyLimit Daily limit of the channel
        # @option opts [String] description channel description
        # @option opts [Array] excludedTerms Excluded terms of the channel
        # @option opts [Integer] id Id of the channel
        # @option opts [Array] includedTerms Included terms of terms channel
        # @option opts [String] industry Industry of the channel
        # @option opts [String] instagramScreenName Instagram screen name
        # @option opts [String] instagramUserId Instagram user ID
        # @option opts [Boolean] isCreatedByWizard Is wizard channel
        # @option opts [Boolean] isLanguageAgnostic Language agnostic
        # @option opts [Boolean] isLockedQuery Is channel locked
        # @option opts [Set] languages channel language
        # @option opts [Date] lastModificationDate Last modification date
        # @option opts [String] lastModifiedUsername Username of the last user that edited the channel
        # @option opts [String] lockedByUsername User who locked channel
        # @option opts [Date] lockedTime Time channel was locked
        # @option opts [String] name Name of the channel
        # @option opts [Integer] samplePercent Sample percent value
        # @option opts [Integer] twitterLimit Twitter limit
        # @option opts [String] twitterScreenName Tracked Twitter screenname
        # @option opts [String] type Type of channel
        # @return [Hash] Updated instagram channel
        def update_instagram_channel(project_id, query_id, opts = {})
          put "projects/#{project_id}/instagramqueries/#{query_id}", opts
        end

        # Delete an Instagram channel
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of query
        def delete_instagram_channel(project_id, query_id)
          delete "/projects/#{project_id}/instagramqueries/#{query_id}"
        end
      end
    end
  end
end
