# frozen_string_literal: true

require_relative 'lib/numary_client/version'

Gem::Specification.new do |spec|
  spec.name = 'numary_client'
  spec.version = NumaryClient::VERSION
  spec.authors = ['Pedro Fernandes Steimbruch']
  spec.email = ['pedro@collateralxp.com']

  spec.summary = 'Ruby client for Numary Ledger API'
  spec.description = 'Easily interact with Numary Ledger API'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = 'https://github.om/collateralxp/numary_client'
  spec.metadata['source_code_uri'] = 'https://github.om/collateralxp/numary_client'
  spec.metadata['changelog_uri'] = 'https://github.om/collateralxp/numary_client'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) ||
        f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.metadata['rubygems_mfa_required'] = 'true'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.16'
  spec.add_development_dependency 'webmock', '~> 3.18'
end
