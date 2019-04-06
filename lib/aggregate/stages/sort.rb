# frozen_string_literal: true

require "contracts"
module Aggregate
  module Stages
    # Represents an aggregation sort
    # https://docs.mongodb.com/manual/reference/operator/aggregation/sort/
    class Sort < HashBase
      Contract HashOf[Symbol, Int] => Any
      def initialize(options)
        super
      end

      def transpose
        { '$sort': options }
      end
    end
  end
end