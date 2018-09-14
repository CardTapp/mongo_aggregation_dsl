# frozen_string_literal: true

module Aggregate
  module Values
    # Takes an array and converts each to the appropriate value handler if one is available.
    class Array < Base
      def to_s
        raise ArgumentError, "Array cannot be a hash key" if is_key

        "[#{value.map { |value| get_value(value, false) }.join(', ')}]"
      end

      class << self
        def handles?(value)
          value.is_a? ::Array
        end
      end
    end
  end
end
