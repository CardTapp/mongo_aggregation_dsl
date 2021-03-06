# frozen_string_literal: true

require "autoloaded"
require "contracts"
require "mongo"
require "mongoid"

Symbol.add_key(:and, "$and", "$and")
Symbol.add_key(:nor, "$nor", "$nor")
Symbol.add_key(:or, "$or", "$or")
Symbol.add_key(:filter, "$filter", "$filter")
Symbol.add_key(:if_null, "$ifNull", "$ifNull")
Symbol.add_key(:cond, "$cond", "$cond")
Symbol.add_key(:set_difference, "$setDifference", "$setDifference")

# The base module for the gem under which all classes are namespaced.
module Aggregate
  Autoloaded.module {}
end

C = Aggregate::Contracts
