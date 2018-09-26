# frozen_string_literal: true

module Aggregate
  module Values
    # Returns a string wrapped in single quotes if the value or string if a key
    class Boolean < Base
      def to_s
        inspect
      end

      def inspect
        value.to_s
      end

      class << self
        def handles?(value)
          value.is_a? ::Boolean
        end
      end
    end
  end
end
