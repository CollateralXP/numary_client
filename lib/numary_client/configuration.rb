# frozen_string_literal: true

module NumaryClient
  class Configuration
    attr_accessor :host, :basic_auth_username, :basic_auth_password

    def uri
      URI.parse(host)
    end
  end
end
