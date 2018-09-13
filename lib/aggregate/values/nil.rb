# frozen_string_literal: true

module Aggregate
  module Values
    # Converts nil to null
    # :reek:NilCheck
    class Nil < Base
      def to_s
        inspect
      end

      def inspect
        raise ArgumentError, "Nil cannot be a hash key" if is_key

        "null"
      end

      class << self
        def handles?(value)
          value.nil?
        end
      end
    end
  end
end
