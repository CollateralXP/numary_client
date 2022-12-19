# NumaryClient

This gem provides a client for the [Numary Ledger](https://github.com/formancehq/ledger).

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add numary_client

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install numary_client

## Usage

The gem provides a configuration for the client:

```ruby
NumaryClient.configure do |config|
  config.host = "http://localhost:3068"
  config.basic_auth_username = 'foo'
  config.basic_auth_password = 'bar'
end
```

Supported operations are:

```ruby
NumaryClient.info # {"data"=>{"server"=>"numary-ledger", "version"=>"1.8.1", "config"=>{"storage"=>{"driver"=>"postgres", "ledgers"=>["quickstart"]}}}}

ledger = NumaryClient::Ledger.new('quickstart')
ledger.stats
ledger.accounts({ page_size:, address:, after:, metadata:, balance:, balance_operator:, pagination_token: })
ledger.balances({ address:, after:, pagination_token: })
ledger.aggregate_balances({ address: })
ledger.execute(plain, vars = {}, options = {})
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CollateralXP/numary_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/numary_client/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the NumaryClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/CollateralXP/numary_client/blob/master/CODE_OF_CONDUCT.md).
