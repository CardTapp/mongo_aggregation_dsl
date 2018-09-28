# frozen_string_literal: true

module Aggregate
  module Values
    # Returns a string wrapped in single quotes if the value or string if a key
    # Additionally adds $ to the reserved aggregation operations.
    class Pipeline < Base
      def transpose
        @value.transpose
      end

      class << self
        def handles?(value)
          value.is_a? ::Aggregate::Pipeline
        end
      end
    end
  end
end
