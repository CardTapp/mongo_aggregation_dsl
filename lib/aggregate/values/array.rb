# frozen_string_literal: true

module Aggregate
  module Values
    class Array < Base
      def to_s
        raise ArgumentError("Array cannot be a hash key") if is_key

        "[#{value.map { |value| get_value(value) }.join(', ')}]"
      end

      class << self
        def handles?(value)
          value.is_a? ::Array
        end
      end

      private

      def get_value(v)
        handler = self.class.value_handlers.detect { |h| h.handles?(v) }
        handler.nil? ? v : handler.new(v, false)
      end
    end
  end
end
