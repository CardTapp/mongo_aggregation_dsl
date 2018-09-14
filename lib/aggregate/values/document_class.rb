# frozen_string_literal: true

module Aggregate
  module Values
    # Takes a mongoid document and returns a string containing the document collection name
    class DocumentClass < Base
      def to_s
        inspect
      end

      def inspect
        raise ArgumentError("Document cannot be a hash key") if is_key

        "'#{value.collection_name}'"
      end

      class << self
        # :reek:ManualDispatch
        def handles?(value)
          return false unless value.respond_to? :included_modules

          value.included_modules.include?(Mongoid::Document)
        end
      end
    end
  end
end
