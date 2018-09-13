# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation facet
    # https://docs.mongodb.com/manual/reference/operator/aggregation/facet/#pipe._S_facet
    class Facet < HashBase
      Contract And[
                   C::HashMinLength[1],
                   HashOf[Symbol, Aggregate::Pipeline]] => Any
      def initialize(options)
        super(options)
      end

      def to_s
        inspect
      end

      def inspect
        "{ $facet: #{options} }"
      end
    end
  end
end
