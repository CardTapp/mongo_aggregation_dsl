# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation replaceRoot
    # https://docs.mongodb.com/manual/reference/operator/aggregation/replaceRoot/#pipe._S_replaceRoot
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
