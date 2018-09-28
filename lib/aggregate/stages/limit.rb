# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation group
    # https://docs.mongodb.com/manual/reference/operator/aggregation/group/#pipe._S_group
    class Limit < Base
      Contract Integer => Any
      def initialize(options)
        super(options)
      end

      def transpose
        { '$limit': options }
      end
    end
  end
end
