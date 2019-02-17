# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation sort
    # https://docs.mongodb.com/manual/reference/operator/aggregation/sort/
    class Sort < HashBase
      def transpose
        { '$sort': options }
      end
    end
  end
end