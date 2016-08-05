require 'faraday'
require 'allotment'

module BWAPI
  module Response
    # Brandwatch response middleware to monitor performance
    class Performance < Faraday::Response::Middleware
      def initialize(app, client)
        super(app)
        @client = client
      end

      def logger
        @logger = @client.logger || begin
          require 'logger'
          ::Logger.new(STDOUT)
        end
      end

      def call(env)
        @recording = "#{env.method}#{env.url.path}".tr!('/', '_')
        Allotment.start(@recording)
        super
      end

      def on_complete(_env)
        logger.info "Response time: #{Allotment.stop(@recording)} seconds"
      end
    end
  end
end
