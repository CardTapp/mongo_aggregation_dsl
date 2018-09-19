# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation unwind
    # https://docs.mongodb.com/manual/reference/operator/aggregation/unwind/#pipe._S_unwind
    class Unwind < Base
      Contract Or[
                   And[String, C::StartsWith["$"]],
                   KeywordArgs[
                      path: And[String, C::StartsWith["$"]],
                      includeArrayIndex: Optional[Boolean],
                      preserveNullAndEmptyArrays: Optional[Boolean]
                   ],
               ] => Any
      def initialize(options)
        super(options)
      end

      def to_s
        inspect
      end

      def inspect
        "{ $unwind: #{options} }"
      end
    end
  end
end
