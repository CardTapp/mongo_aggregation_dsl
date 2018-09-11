# frozen_string_literal: true

module Aggregate
  module Contracts
    class ClassIncludes < ::Contracts::Builtin::CallableClass
      def initialize(*klasses)
        @klasses = klasses
      end

      def valid?(object)
        @klasses.all? { |klass| klass.respond_to?(:included_modules) && klass.included_modules.include?(object) }
      end

      def to_s
        "Expected to include #{@klasses}"
      end

      def inspect
        to_s
      end
    end
  end
end
