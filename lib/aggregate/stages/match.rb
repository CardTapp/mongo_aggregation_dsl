# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation match
    # https://docs.mongodb.com/manual/reference/operator/aggregation/match/#pipe._S_match
    # TODO: Should probably have two match types.
    # A simple match `match(account_id: BSON::ObjectId("11111111111111111111"))`
    # An expression match `match( :expr.and => [ { eq: %w[$user_id $$user_id] }] )`
    class Match < HashBase
      Contract Or[HashOf[Symbol, Any], HashOf[Mongoid::Criteria::Queryable::Key, Any]] => Any
      def initialize(options)
        super(options)
      end

      def transpose
        { '$match': options }
      end
    end
  end
end
