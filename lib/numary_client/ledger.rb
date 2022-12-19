# frozen_string_literal: true

module NumaryClient
  class Ledger
    def initialize(name)
      @name = name
    end

    def stats
      ApiClient.current_client.get("/#{name}/stats")
    end

    def accounts(query = {})
      ApiClient.current_client.get("/#{name}/accounts", query)
    end

    def balances(query = {})
      ApiClient.current_client.get("/#{name}/balances", query)
    end

    def aggregate_balances(query = {})
      ApiClient.current_client.get("/#{name}/aggregate/balances", query)
    end

    def execute(plain, vars = {}, options = {})
      args = { plain: plain, vars: vars, **options }.compact

      ApiClient.current_client.post("/#{name}/script", args)
    end

    private

    attr_reader :name
  end
end
