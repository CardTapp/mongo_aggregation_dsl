# frozen_string_literal: true

module Aggregate
  module Values
    # derived value handlers are required to implement the following contract
    # def to_s
    #   # Returns a properly formatted string for the given value. Note that care
    #   # should be taken to properly format as a hash key or value depending on is_key
    # end
    # class << self
    #   def handles?(value)
    #     # returns true if this value handler can handle transforming the given value type into a string
    #   end
    # end
    #
    # In keeping with duck typing the above are not implemented here and will not raise
    # a NotImplementedError. Instead a standard MethodMissing will be raised if a value handler
    # cannot be called with `handles?(value)` or `to_s`
    #
    # http://chrisstump.online/2016/03/23/stop-abusing-notimplementederror/
    class Base
      attr_reader :value, :is_key
      def initialize(value, is_key)
        @value = value
        @is_key = is_key
      end

      def to_s
        transpose.to_s
      end

      class << self
        def value_handlers
          @value_handlers ||= (Aggregate::Values.constants - [:Base]).map do |klass|
            "Aggregate::Values::#{klass}".constantize
          end
        end
      end

      private

      private

      def get_value(original_value, is_hash_key)
        handler = self.class.value_handlers.detect { |handler| handler.handles?(original_value) }
        handler.nil? ? original_value : handler.new(original_value, is_hash_key).transpose
      end
    end
  end
end
