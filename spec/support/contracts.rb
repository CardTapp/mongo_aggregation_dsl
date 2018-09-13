# frozen_string_literal: true

# # frozen_string_literal: true
#
# Contract.validator_strategies.map do |strategy, validator|
#   Contract.override_validator(strategy) do |contract|
#     lambda do |arg|
#       (Object.const_defined?("RSpec::Mocks::Double") && arg.is_a?(RSpec::Mocks::Double)) ||
#           (Object.const_defined?("RSpec::Mocks::TestDouble") && arg.is_a?(RSpec::Mocks::TestDouble)) ||
#           validator.call(contract).call(arg)
#     end
#   end
# end
