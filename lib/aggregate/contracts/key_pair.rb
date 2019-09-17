# frozen_string_literal: true

module Aggregate
  module Contracts
    # Validates the specified hash key=>value combination can be an OriginKey => specified types
    class KeyPair < ::Contracts::Builtin::CallableClass
      def initialize(*vals)
        @range = vals[0]
        @key_types = vals[1]
        @value_types = vals[2]
        @error = nil
      end

      def valid?(hash)
        new_hash = hash.dup.slice(*hash.keys[@range])
        new_hash.all? do |key, value|
          @key_types.include?(key.class) && @value_types.include?(value.class)
        end
      end

      def to_s
        "Hash values in range #{@range} to have a key in allowed types `#{@key_types}` and value in allowed types ``#{@types}``"
      end

      def inspect
        to_s
      end
    end
  end
end
