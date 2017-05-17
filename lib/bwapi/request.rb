require 'faraday'

module BWAPI
  # Request module
  module Request
    # Perform a get request
    #
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hash] Response body
    def get(path, opts = {})
      request(:get, path, opts).body
    end

    # Perform a delete request
    #
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hash] Response body
    def delete(path, opts = {})
      request(:delete, path, opts).body
    end

    # Perform a post request
    #
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hash] Response body
    def post(path, opts = {})
      request(:post, path, opts).body
    end

    # Perform a put request
    #
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hash] Response body
    def put(path, opts = {})
      request(:put, path, opts).body
    end

    # Perform a patch request
    #
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hash] Response body
    def patch(path, opts = {})
      request(:patch, path, opts).body
    end

    private

    # Perform a request
    #
    # @param method [String] Type of request
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hash] Response
    def request(method, path, opts = {})
      tries ||= 0
      send_request(method, path, opts)
    rescue Faraday::ConnectionFailed => e
      warn "Faraday failed to connect with the error: #{e.message}"
      raise e unless (tries += 1) < connection_attempts
      warn "Resetting and retrying. Retry: #{tries}"
      reset_connection
      retry
    end

    # Send the request to the connection object
    #
    # @param method [String] Type of request
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [Hash] Response
    def send_request(method, path, opts)
      connection.send(method) do |req|
        case method
        when :get
          path = request_extension(path, opts)
          request_url(req, path, opts)
        when :delete
          request_url(req, path, opts)
        when :patch, :post, :put
          request_body(req, path, opts)
        end
      end
    end

    # Appends the request extension to the path
    #
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    # @return [String] path appended with request extension
    def request_extension(path, opts)
      extension = key?(opts, :request_extension)
      extension ? [path, extension].join('.') : path
    end

    # Configures url encoded request unless force_body key is passed
    #
    # @param req [Object] the request object
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    def request_url(req, path, opts)
      if key?(opts, :force_body)
        req.path = path
        req.body = opts
      else
        req.url path, opts
      end
    end

    # Configures body request unless force_urlencoded key is passed
    #
    # @param req [Object] the request object
    # @param path [String] URL path to send request
    # @param opts [Hash] Request parameters
    def request_body(req, path, opts)
      if key?(opts, :force_urlencoded)
        req.url path, opts
      else
        req.path = path
        req.body = opts
      end
    end

    # Checks if a request options has a given key
    # Deletes the key if it is present
    #
    # @param opts [Hash] Request parameters
    # @param key [Symbol] The key to check for
    def key?(opts, key)
      return false unless opts.is_a?(Hash) && opts.key?(key)
      opts.delete(key)
    end
  end
end
