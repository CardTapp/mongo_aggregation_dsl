# frozen_string_literal: true

module Aggregate
  module Values
    class Hash < Base
      def to_s
        inspect
      end

      def inspect
        raise ArgumentError("Hash cannot be a hash key") if is_key

        "{ #{transpose_options.map { |k, v| "#{k}: #{v}" }.join(', ')} }"
      end

      private

      def get_value(v, is_hash_key)
        handler = self.class.value_handlers.detect { |h| h.handles?(v) }
        handler.nil? ? v : handler.new(v, is_hash_key)
      end

      def transpose_options
        new_hash = {}
        value.each do |k, v|
          if k.is_a?(Origin::Key)
            expression = k.__expr_part__(v)
            k = expression.keys.first.to_sym
            v = expression.values.first
          end

          k = get_value(k, true)
          v = get_value(v, false)

          new_hash[k] = v
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
