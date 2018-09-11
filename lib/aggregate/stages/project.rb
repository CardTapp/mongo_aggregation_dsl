# frozen_string_literal: true

module Aggregate
  module Stages
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
