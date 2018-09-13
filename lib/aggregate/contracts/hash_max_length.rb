# frozen_string_literal: true

module Aggregate
  module Contracts
    class HashMaxLength < ::Contracts::Builtin::CallableClass
      def initialize(*vals)
        @length = vals[0]
      end

      def valid?(hash)
        hash.length <= @length
      end

      def to_s
        "Hash length to be lessthan than or equal to #{@length}"
      end

      def inspect
        to_s
      end
    end
  end
end
