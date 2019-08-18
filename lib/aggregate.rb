# frozen_string_literal: true

require "autoloaded"
require "contracts"
require "mongo"
require "mongoid"
require "origin"

# Extend Symbol with origin handler functions
Symbol.add_key(:and, "$and", "$and")
Symbol.add_key(:nor, "$nor", "$nor")
Symbol.add_key(:or, "$or", "$or")
Symbol.add_key(:filter, "$filter", "$filter")
Symbol.add_key(:if_null, "$ifNull", "$ifNull")

# The base module for the gem under which all classes are namespaced.
module Aggregate
  Autoloaded.module {}
end

C = Aggregate::Contracts
