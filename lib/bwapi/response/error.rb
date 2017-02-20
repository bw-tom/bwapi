require 'bwapi/error'
require 'faraday'

module BWAPI
  module Response
    # Brandwatch response middleware to handle errors
    class Error < Faraday::Response::Middleware
      ERROR_MAP = {
        400 => BWAPI::BadRequest,
        401 => BWAPI::Unauthorized,
        403 => BWAPI::Forbidden,
        404 => BWAPI::NotFound,
        406 => BWAPI::NotAcceptable,
        422 => BWAPI::UnprocessableEntity,
        429 => BWAPI::TooManyRequests,
        500 => BWAPI::InternalServerError,
        501 => BWAPI::NotImplemented,
        502 => BWAPI::BadGateway,
        503 => BWAPI::ServiceUnavailable
      }.freeze

      def on_complete(response)
        key = response[:status].to_i
        raise ERROR_MAP[key].new(response) if ERROR_MAP.key? key
      end
    end
  end
end
