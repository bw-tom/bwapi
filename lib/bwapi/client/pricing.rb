module BWAPI
  class Client
    module Pricing
      def get_pricing(opts = {}, params = {})
        get 'pricing', opts, params
      end
    end
  end
end
