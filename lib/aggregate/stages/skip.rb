# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation skip
    # https://www.mongodb.com/docs/manual/reference/operator/aggregation/skip/
    class Skip < Base
      Contract Integer => Any
      def initialize(options)
        super(options)
      end

      def transpose
        { '$skip': options }
      end
    end
  end
end
