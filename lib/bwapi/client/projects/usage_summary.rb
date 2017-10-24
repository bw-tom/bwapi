module BWAPI
  class Client
    module Projects
      module UsageSummary
        def get_usagesummary(project_id)
          get "projects/#{project_id}/usagesummary"
        end
      end
    end
  end
end
