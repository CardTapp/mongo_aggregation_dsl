# frozen_string_literal: true

module Aggregate
  module Stages
    # TODO: Should probably have two match types.
    # A simple match `match(account_id: BSON::ObjectId("11111111111111111111"))`
    # An expression match `match( :expr.and => [ { eq: %w[$user_id $$user_id] }] )`
    class Match < HashBase
      Contract Or[HashOf[Symbol, Any], HashOf[Origin::Key, Any]] => Any
      def initialize(options)
        super(options)
      end

      def to_s
        inspect
      end

      def inspect
        "{ $match: #{options} }"
      end
    end
  end
end
