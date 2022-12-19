# frozen_string_literal: true

require_relative 'numary_client/version'
require_relative 'numary_client/configuration'
require_relative 'numary_client/api_client'
require_relative 'numary_client/ledger'

module NumaryClient
  class Error < StandardError; end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end

    def info
      ApiClient.current_client.get('/_info')
    end
  end
end
