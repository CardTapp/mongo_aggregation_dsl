# frozen_string_literal: true

module Aggregate
  module Contracts
    class StartsWith < ::Contracts::Builtin::CallableClass
      def initialize(*args)
        @start = args[0]
      end

      def valid?(object)
        object.to_s.start_with?(@start)
      end

      def to_s
        "Expected to start with #{@start}"
      end

      def inspect
        to_s
      end
    end
  end
end
