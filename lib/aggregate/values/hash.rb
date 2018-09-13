# frozen_string_literal: true

module Aggregate
  module Values
    # Takes hash and converts each key and pair to the appropriate value handler if one is available.
    class Hash < Base
      def to_s
        inspect
      end

      def inspect
        raise ArgumentError("Hash cannot be a hash key") if is_key

        "{ #{transpose_options.map { |hash_key, hash_value| "#{hash_key}: #{hash_value}" }.join(', ')} }"
      end

      private

      def transpose_options
        new_hash = {}
        value.each do |original_key, original_value|
          if original_key.is_a?(Origin::Key)
            expression = original_key.__expr_part__(original_value)
            original_key = expression.keys.first.to_sym
            original_value = expression.values.first
          end

          new_key = get_value(original_key, true)
          new_value = get_value(original_value, false)

          new_hash[new_key] = new_value
        end
        new_hash
      end

      class << self
        def handles?(value)
          value.is_a? ::Hash
        end
      end
    end
  end
end
