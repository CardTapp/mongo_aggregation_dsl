# frozen_string_literal: true

module Aggregate
  module Contracts
    # Validates the value types in a given range are of a given type
    class HashValueType < ::Contracts::Builtin::CallableClass
      def initialize(*vals)
        @range = vals[0]
        @type = vals[1]
        @error = nil
      end

      def valid?(hash)
        values = hash.values[@range]
        if values.is_a? Array
          values.all? { |value| value.is_a? @type }
        else
          values.is_a?(@type)
        end
      end

      def to_s
        "Hash values #{@range} to be of type #{@type}"
      end

      def inspect
        to_s
      end
    end
  end
end
