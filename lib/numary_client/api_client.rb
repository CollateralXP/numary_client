# frozen_string_literal: true

module NumaryClient
  class ApiClient
    def self.current_client
      Thread.current[:numary_client__api_client] ||= new(NumaryClient.configuration)
    end

    def get(path, query = {})
      path += "?#{URI.encode_www_form(query)}" if query.any?

      request = build_request(:get, path)

      response = @connection.request(request)

      JSON.parse(response.body)
    end

    def post(path, body, query = {})
      path += "?#{URI.encode_www_form(query)}" if query.any?

      request = build_request(:post, path, body: true)

      response = @connection.request(request, body.to_json)

      JSON.parse(response.body)
    end

    private

    def initialize(configuration)
      @configuration = configuration

      @connection = Net::HTTP.new(@configuration.uri.host, @configuration.uri.port)
      @connection.use_ssl = @configuration.uri.scheme == 'https'
      @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @connection.keep_alive_timeout = 30
    end

    def build_request(method_name, path, body: false)
      request = Net::HTTPGenericRequest.new(method_name.to_s.upcase,
                                            body,
                                            true,
                                            path,
                                            { 'Content-type' => 'application/json' })

      if @configuration.basic_auth_username && @configuration.basic_auth_password
        request.basic_auth(@configuration.basic_auth_username, @configuration.basic_auth_password)
      end

      request
    end
  end
end
