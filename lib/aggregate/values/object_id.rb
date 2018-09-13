# frozen_string_literal: true

module Aggregate
  module Values
    # Converts a BSON::Object id to a string `ObjectId('123')`
    class ObjectId < Base
      def to_s
        inspect
      end

      def inspect
        raise ArgumentError, "ObjectId cannot be a hash key" if is_key

        "ObjectId('#{value}')"
      end

      class << self
        def handles?(value)
          value.is_a? BSON::ObjectId
        end
      end
    end
  end
end
