# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation project
    # https://docs.mongodb.com/manual/reference/operator/aggregation/project/#pipe._S_project
    class Project < HashBase
      def to_s
        inspect
      end

      def inspect
        "{ $project: #{options} }"
      end
    end
  end
end
