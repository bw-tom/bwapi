module BWAPI
  class Client
    module Projects
      # Research module for research projects endpoints
      module Research
        # Get all research projects
        #
        # @param opts [Hash] options hash of parameters
        # @option opts [Integer] page Page of results to retrieve
        # @option opts [Integer] pageSize Results per page of results
        # @return [Hash] All research projects
        def get_research_projects(opts = {})
          get 'projects/published', opts
        end

        # Edits a published project and returns the published attributes
        #
        # @param project_id [Integer] projectId Project Id to retrieve/edit
        # @param opts [Hash] options hash of parameters
        # @option opts [String] imageUrl Research project picture
        # @option opts [Boolean] published Is published in Research Store
        # @return [Hash] Specific edited research project
        def update_research_projects(project_id, opts = {})
          put "projects/published/#{project_id}", opts
        end
      end
    end
  end
end
