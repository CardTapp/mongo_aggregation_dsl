# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation group
    # https://docs.mongodb.com/manual/reference/operator/aggregation/group/#pipe._S_group
    class Group < HashBase
      Contract And[
                   Or[
                       C::KeyPair[0..0, [String, Symbol], [Symbol, String, Hash, NilClass]],
                       C::KeyPair[0..0, [Mongoid::Criteria::Queryable::Key], [Symbol, String, Hash, NilClass, Array]]
                   ],
                   C::KeyPair[1..-1, [String, Symbol, Mongoid::Criteria::Queryable::Key], [Integer, String, Hash]]
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
