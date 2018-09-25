# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "mongo_aggregation_dsl"
  spec.version = "0.0.0.pre4"
  spec.authors = ["KrimsonKla"]
  spec.email   = ["admin@cardtapp.com"]
  spec.date = "2018-09-10"
  spec.summary = "An aggregation DSL for use with mongo ruby driver"

  spec.homepage    = "http://www.cardtapp.com"
  spec.license     = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ["lib"]

  spec.add_dependency "autoloaded", "~> 2"
  spec.add_dependency "contracts-lite"
  spec.add_dependency "mongo", "~> 2.6.2"
  spec.add_dependency "mongoid", "~> 5.2.0"
  spec.add_dependency "origin", "~> 2.3.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "codecov", "~> 0.1", "~> 0.1.0"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "pronto"
  spec.add_development_dependency "pronto-brakeman"
  spec.add_development_dependency "pronto-circleci"
  spec.add_development_dependency "pronto-fasterer"
  spec.add_development_dependency "pronto-rails_best_practices"
  spec.add_development_dependency "pronto-reek"
  spec.add_development_dependency "pronto-rubocop"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec_junit_formatter", "~> 0.3.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-rcov"
end
