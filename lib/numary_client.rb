# frozen_string_literal: true

require_relative 'numary_client/version'
require_relative 'numary_client/configuration'
require_relative 'numary_client/api_client'

module NumaryClient
  class Error < StandardError; end

  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
