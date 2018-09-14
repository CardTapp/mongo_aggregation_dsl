# frozen_string_literal: true

module Aggregate
  module Contracts
    # Validates a hash length does not exceed the max given value
    class HashMaxLength < ::Contracts::Builtin::CallableClass
      def initialize(*vals)
        @length = vals[0]
      end

      def valid?(hash)
        hash.length <= @length
      end

      def to_s
        "Hash length to be less than than or equal to #{@length}"
      end

      def inspect
        to_s
      end
    end
  end
end
