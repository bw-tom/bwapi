module BWAPI
  class Client
    module Projects
      # PreviewSearch module for projects/{projectId}/previewsearch endpoints
      module PreviewSearch
        # Create a project preview search for mentions
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        # @option opts [Integer] resultsPage The results page
        # @option opts [Integer] resultsPageSize The results page size
        # @return [Hash] Mentions
        def project_preview_search_mentions(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/mentions", opts
        end

        # Create a project preview search for author
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] author The mentions author
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        # @option opts [Integer] resultsPage The results page
        # @option opts [Integer] resultsPageSize The results page size
        # @return [Hash] Author
        def project_preview_search_author(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/author", opts
        end

        # Create a project preview search for daily mentions
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] day The mention day
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        # @option opts [Integer] resultsPage The results page
        # @option opts [Integer] resultsPageSize The results page size
        # @return [Hash] Daily mentions
        def project_preview_search_dailymentions(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/dailymentions", opts
        end

        # Create a project preview search for history tab
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        # @option opts [Integer] resultsPage The results page
        # @option opts [Integer] resultsPageSize The results page size
        # @return [Hash] Mentions for history tab
        def project_preview_search_history(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/history", opts
        end

        # Create a project preview search for site tab
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        # @option opts [String] site The site
        # @option opts [Integer] resultsPage The results page
        # @option opts [Integer] resultsPageSize The results page size
        # @return [Hash] Mentions for site tab
        def project_preview_search_site(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/site", opts
        end

        # Create a project preview search for top authors
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        #
        # @return [Hash] Mentions for top authors tab
        def project_preview_search_topauthors(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/topauthors", opts
        end

        # Create a project preview search for topic
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] author The mentions author
        # @option opts [String] topic The topic
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        # @option opts [Integer] resultsPage The results page
        # @option opts [Integer] resultsPageSize The results page size
        #
        # @return [Hash] Topic for topic tab
        def project_preview_search_topic(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/topic", opts
        end

        # Create a project preview search for topics
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        #
        # @return [Hash] Topics for topic tab
        def project_preview_search_topics(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/topics", opts
        end

        # Create a project preview search for top sites
        #
        #
        # @param project_id [Integer] Id of project
        # @param opts [Hash] options hash of parameters
        # @option opts [String] endDate The mentions end date
        # @option opts [String] startDate The mentions start date
        # @option opts [Array] exclusionSnippets The array with snippets exclussion
        # @option opts [Boolean] languageAgnostic The agnostic language
        # @option opts [Array] languages The query language
        # @option opts [String] queryString The query string content
        # @option opts [String] queryType The query type
        #
        # @return [Hash] Top sites for topsites tab
        def project_preview_search_topsites(project_id, opts = {})
          post "/projects/#{project_id}/previewsearch/topsites", opts
        end
      end
    end
  end
end
