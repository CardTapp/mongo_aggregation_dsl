# frozen_string_literal: true

module Aggregate
  module Stages
    class ReplaceRoot < Base
      Contract And[String, C::StartsWith["$"]] => Any
      def initialize(new_root)
        super(new_root)
      end

      def to_s
        inspect
      end

      def inspect
        "{ $replaceRoot: {newRoot: #{options}} }"
      end
    end
  end
end
