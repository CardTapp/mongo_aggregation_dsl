# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation group
    # https://docs.mongodb.com/manual/reference/operator/aggregation/group/#pipe._S_group
    class Group < HashBase
      Contract And[
                   Not[C::HashValueType[0, Hash]],
                   C::KeyPair[1..-1, [String, Symbol, Origin::Key], [Integer, String, Hash]]
               ] => Any
      def initialize(options)
        super(options)
      end

      def transpose
        { '$group': options }
      end
    end
  end
end
