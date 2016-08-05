require 'bwapi/client/projects/queries/backfill'
require 'bwapi/client/projects/queries/date_range'
require 'bwapi/client/projects/queries/mentions'
require 'bwapi/client/projects/queries/move'

module BWAPI
  class Client
    module Projects
      # Queries module for projects/queries endpoints
      module Queries
        # Get all queries in project
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] nameContains partial name to filter by
        # @option opts [Array] type types of query to filter by
        # @option opts [Integer] page Page of results to retrieve
        # @option opts [Integer] pageSize Results per page of results
        # @return [Hash] All queries in project
        def queries(project_id, opts = {})
          get "projects/#{project_id}/queries", opts
        end

        # Get summary of all queries in project
        #
        # @param project_id [Integer] Id of project
        # @return [Hash] Summary of all queries in project
        def queries_summary(project_id)
          get "projects/#{project_id}/queries/summary"
        end

        # Get a specific wizard query in project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of query
        # @return [Hash] Specific wizard query
        def get_wizard_query(project_id, query_id)
          get "projects/#{project_id}/querywizard/#{query_id}"
        end

        # Get a specific query in project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of query
        # @return [Hash] Specific query
        def get_query(project_id, query_id)
          get "projects/#{project_id}/queries/#{query_id}"
        end

        # Create a new query in project
        #
        # @param project_id [Integer] Id of project
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
        # @option opts [Date] lastModificationDate Modification date of the query
        # @return [Hash] New query
        def create_query(project_id, opts = {})
          post "projects/#{project_id}/queries", opts
        end

        # Create a wizard query in project
        #
        # @param project_id [Integer] Id of project
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
        # @option opts [String] usecase The Usecase the Query was created for
        # @option opts [String] type Type of query
        # @option opts [Object] queryWizardConfiguration JSON object containing configuration for Query Wizard
        # @option opts [Date] creationDate Date the query was created on
        # @option opts [Date] lastModificationDate Modification date of the query
        # @return [Hash] New query wizard
        def create_wizard_query(project_id, opts = {})
          post "projects/#{project_id}/querywizard", opts
        end

        # Update an existing query in project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of query
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
        # @option opts [Date] lastModificationDate Modification date of the query
        # @return [Hash] Updated query
        def update_query(project_id, query_id, opts = {})
          put "projects/#{project_id}/queries/#{query_id}", opts
        end

        # Update an existing wizard query in project
        #
        # @param project_id [Integer] Id of project
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
        # @option opts [String] usecase The Usecase the Query was created for
        # @option opts [String] type Type of query
        # @option opts [Object] queryWizardConfiguration JSON object containing configuration for Query Wizard
        # @option opts [Date] creationDate Date the query was created on
        # @option opts [Date] lastModificationDate Modification date of the query
        # @return [Hash] Update query wizard
        def update_wizard_query(project_id, query_id, opts = {})
          put "projects/#{project_id}/querywizard/#{query_id}", opts
        end

        # Delete an existing query project
        #
        # @param project_id [Integer] Id of project
        # @param query_id [Integer] Id of query
        # @return [Hash] Deleted query
        def delete_query(project_id, query_id)
          delete "projects/#{project_id}/queries/#{query_id}"
        end

        include BWAPI::Client::Projects::Queries::Backfill
        include BWAPI::Client::Projects::Queries::DateRange
        include BWAPI::Client::Projects::Queries::Mentions
        include BWAPI::Client::Projects::Queries::Move
      end
    end
  end
end
