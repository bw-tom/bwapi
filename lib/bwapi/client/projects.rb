require 'bwapi/client/projects/alerts'
require 'bwapi/client/projects/bulk_actions'
require 'bwapi/client/projects/categories'
require 'bwapi/client/projects/data'
require 'bwapi/client/projects/data_download'
require 'bwapi/client/projects/demographics'
require 'bwapi/client/projects/ditto_queries'
require 'bwapi/client/projects/decahose_queries'
require 'bwapi/client/projects/facebook_queries'
require 'bwapi/client/projects/group'
require 'bwapi/client/projects/instagram_queries'
require 'bwapi/client/projects/preview_search'
require 'bwapi/client/projects/queries'
require 'bwapi/client/projects/query/mentionfind'
require 'bwapi/client/projects/query_groups'
require 'bwapi/client/projects/research'
require 'bwapi/client/projects/rules'
require 'bwapi/client/projects/sharing'
require 'bwapi/client/projects/signals'
require 'bwapi/client/projects/stream_dashboards'
require 'bwapi/client/projects/summary'
require 'bwapi/client/projects/tags'
require 'bwapi/client/projects/twitter_queries'
require 'bwapi/client/projects/users'
require 'bwapi/client/projects/workflow'

module BWAPI
  class Client
    # Projects module for projects endpoints
    module Projects
      # Get all projects
      #
      # @param opts [Hash] options hash of parameters
      # @option opts [Integer] page Page of results to retrieve
      # @option opts [Integer] pageSize Results per page of results
      # @return [Hash] All projects
      def projects(opts = {})
        get 'projects', opts
      end

      # Get a specific project
      #
      # @param project_id [Integer] Id of the existing project
      # @return [Hash] Specific project
      def get_project(project_id)
        get "projects/#{project_id}"
      end

      # Create new project
      #
      # @param opts [Hash] options hash of parameters
      # @option opts [String] name Name of the project
      # @option opts [String] description Description of the project
      # @option opts [String] clientName Client name of the project
      # @option opts [String] clientId Client id of the project
      # @option opts [Array] defaultIndustry Default industry of the project
      # @option opts [Array] defaultLangCodes Default languages of the project
      # @option opts [Date] creationDate Date the project was created on
      # @option opts [Integer] creationUserId User ID of the user who created the project
      # @return [Hash] New project
      def create_project(opts = {})
        post 'projects', opts
      end

      # Update an existing project
      #
      # @param project_id [Integer] id Id of the existing project
      # @param opts [Hash] options Hash of parameters
      # @option opts [String] name Name of the project
      # @option opts [String] description Description of the project
      # @option opts [String] clientName Client name of the project
      # @option opts [String] clientId Client id of the project
      # @option opts [Array] defaultIndustry Default industry of the project
      # @option opts [Array] defaultLangCodes Default languages of the project
      # @option opts [Date] creationDate Date the project was created on
      # @option opts [Integer] creationUserId User ID of the user who created the project
      # @return [Hash] Updated project
      def update_project(project_id, opts = {})
        put "projects/#{project_id}", opts
      end

      # Delete an existing project
      #
      # @param project_id [Integer] id Id of the existing project
      # @return [Hash] Deleted project
      def delete_project(project_id)
        delete "projects/#{project_id}"
      end

      # Copy Published Projects into current user account
      #
      # @param project_id [Integer] Id of project
      # @param opts [Hash] options hash of parameters
      # @option opts [Hash] structureOnly should copy only the structure (no backfills)
      # backfills should be run reperatly
      # @return [Hash] Copied project
      def copy_project(project_id, opts = {})
        post "projects/#{project_id}/copy", opts
      end

      # Given a query id retrieve summary statistics for the given Twitter audience
      #
      # TODO: Add parameters documentation
      def project_twitter_audience_summary(project_id, opts = {})
        get "/projects/#{project_id}/twitteraudiencesummary", opts
      end

      include BWAPI::Client::Projects::Alerts
      include BWAPI::Client::Projects::BulkActions
      include BWAPI::Client::Projects::Categories
      include BWAPI::Client::Projects::Data
      include BWAPI::Client::Projects::DataDownload
      include BWAPI::Client::Projects::Demographics
      include BWAPI::Client::Projects::DecahoseQueries
      include BWAPI::Client::Projects::DittoQueries
      include BWAPI::Client::Projects::FacebookQueries
      include BWAPI::Client::Projects::Group
      include BWAPI::Client::Projects::InstagramQueries
      include BWAPI::Client::Projects::PreviewSearch
      include BWAPI::Client::Projects::Queries
      include BWAPI::Client::Projects::Query::MentionFind
      include BWAPI::Client::Projects::QueryGroups
      include BWAPI::Client::Projects::Research
      include BWAPI::Client::Projects::Rules
      include BWAPI::Client::Projects::Sharing
      include BWAPI::Client::Projects::Signals
      include BWAPI::Client::Projects::StreamDashboards
      include BWAPI::Client::Projects::Summary
      include BWAPI::Client::Projects::Tags
      include BWAPI::Client::Projects::TwitterQueries
      include BWAPI::Client::Projects::Users
      include BWAPI::Client::Projects::Workflow
    end
  end
end
