module BWAPI
  class Client
    module Projects
      # Decahose Queries module for projects/decahosequeries endpoints
      module DecahoseQueries
        # Get all decahose queries in project
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] nameContains partial name to filter by
        # @option opts [Integer] page Page of results to retrieve
        # @option opts [Integer] pageSize Results per page of results
        # @return [Hash] All queries in project
        def decahose_queries(project_id, opts = {})
          get "projects/#{project_id}/decahosequeries", opts
        end

        # Get a specific decahose query in project
        #
        # @param project_id [Integer] Id of project
        # @param decahose_query_id [Integer] Id of decahose query
        # @return [Hash] Specific decahose query
        def get_decahose_query(project_id, decahose_query_id)
          get "projects/#{project_id}/decahosequeries/#{decahose_query_id}"
        end

        # Create a new decahose query in project
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] id Id of the decahose query
        # @option opts [String] name Name of the project
        # @option opts [Integer] dailyLimit Daily limit of the query
        # @option opts [Integer] twitterLimit Twitter limit of the query
        # @option opts [Integer] averageMonthlyMentions Average monthly mentions
        # @option opts [String] type Query type
        # @option opts [Array] includedTerms Included terms of terms query
        # @option opts [Array] contextTerms Content terms of the query
        # @option opts [Array] excludedTerms Excluded terms of thequery
        # @option opts [Array] languages Query languages
        # @option opts [String] twitterScreenName Tracked twitter screen name
        # @option opts [String] industry Industry of the query
        # @option opts [Date] creationDate Date the query was created on
        # @option opts [Date] lastModificationDate Mod. date of the query
        # @return [Hash] New decahose query
        def create_decahose_query(project_id, opts = {})
          post "projects/#{project_id}/decahosequeries", opts
        end

        # Update an existing decahose query in project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of decahose query
        # @param opts [Hash] options hash of parameters
        # @option opts [Integer] id Id of the query
        # @option opts [String] name Name of the project
        # @option opts [Integer] dailyLimit Daily limit of the query
        # @option opts [Integer] twitterLimit Twitter limit of the query
        # @option opts [Integer] averageMonthlyMentions Average monthly mentions
        # @option opts [String] type Query type
        # @option opts [Array] includedTerms Included terms of terms query
        # @option opts [Array] contextTerms Content terms of the query
        # @option opts [Array] excludedTerms Excluded terms of thequery
        # @option opts [Array] languages Query languages
        # @option opts [String] twitterScreenName Tracked twitter screen name
        # @option opts [String] industry Industry of the query
        # @option opts [Date] creationDate Date the query was created on
        # @option opts [Date] lastModificationDate Mod. date of the query
        # @return [Hash] Updated query
        def update_decahose_query(project_id, decahose_query_id, opts = {})
          put "projects/#{project_id}/decahosequeries/#{decahose_query_id}", opts
        end

        # Delete an existing decahose query project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of decahose query
        # @return [Hash] Deleted decahose query
        def delete_decahose_query(project_id, decahose_query_id)
          delete "projects/#{project_id}/decahosequeries/#{decahose_query_id}"
        end
      end
    end
  end
end
