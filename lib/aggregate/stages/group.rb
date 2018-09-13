# frozen_string_literal: true

module Aggregate
  module Stages
    class Group < HashBase
      Contract And[
                   Not[C::HashValueType[0, Hash]],
                   C::HashValueType[1..-1, Hash]
               ] => Any
      def initialize(options)
        super(options)
      end

      def to_s
        inspect
      end

      def inspect
        "{ $group: #{options} }"
      end
    end
  end
end
