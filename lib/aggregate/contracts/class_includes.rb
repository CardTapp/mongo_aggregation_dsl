# frozen_string_literal: true

module Aggregate
  module Contracts
    # Validates that a class includes a given module
    class ClassIncludes < ::Contracts::Builtin::CallableClass
      def initialize(klasses)
        @klasses = [klasses].flatten(1)
      end

      # :reek:FeatureEnvy
      # :reek:ManualDispatch
      def valid?(object)
        @klasses.all? { |klass| object.respond_to?(:included_modules) && object.included_modules.include?(klass) }
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
