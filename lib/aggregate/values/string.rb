# frozen_string_literal: true

module Aggregate
  module Values
    # Returns a string wrapped in single quotes if the value or string if a key
    class String < Base
      def to_s
        inspect
      end

      def inspect
        is_key ? value.to_s : "'#{value}'"
      end

      class << self
        def handles?(value)
          value.is_a? ::String
        end
      end
    end
  end
end
