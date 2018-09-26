# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation lookup
    # https://docs.mongodb.com/manual/reference/operator/aggregation/lookup/#pipe._S_lookup
    class Lookup < HashBase
      Contract Or[
                   KeywordArgs[
                       from:         C::ClassIncludes[[Mongoid::Document]],
                       as:           String,
                       localField:   String,
                       foreignField: String],
                   KeywordArgs[
                       from:     C::ClassIncludes[[Mongoid::Document]],
                       as:       String,
                       let:      And[HashOf[Symbol, Symbol], C::HashMinLength[1]],
                       pipeline: Aggregate::Pipeline]
                 ] => Any
      def initialize(options)
        super(options)
      end

      def to_s
        inspect
      end

      def inspect
        "{ $lookup: #{options} }"
      end
    end
  end
end
