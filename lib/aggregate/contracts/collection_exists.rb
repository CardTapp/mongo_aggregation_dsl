# frozen_string_literal: true

module Aggregate
  module Contracts
    # Validates that a class includes a given module
    class CollectionExists < ::Contracts::Builtin::CallableClass
      # :reek:FeatureEnvy
      # :reek:ManualDispatch
      def valid?(object)
         Mongoid.default_client.collections.find { |collection| collection.name == object.to_s }.present?
      end

      def to_s
        "Expected to mongo db to contain collection #{@collection}"
      end

      def inspect
        to_s
      end
    end
  end
end
