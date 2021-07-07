# frozen_string_literal: true

module Aggregate
  module Stages
    # Represents an aggregation unwind
    # https://docs.mongodb.com/manual/reference/operator/aggregation/unwind/#pipe._S_unwind
    class Unwind < Base
      Contract Or[
                   And[String, C::StartsWith["$"]],
                   KeywordArgs[
                      path:                       And[String, C::StartsWith["$"]],
                      includeArrayIndex:          Optional[String],
                      preserveNullAndEmptyArrays: Optional[Mongoid::Boolean]
                   ],
               ]                                                                                                                                                                                                                                                                                                                                                         => Any
      def initialize(options)
        super(options)
      end

      def transpose
        { '$unwind': options }
      end
    end
  end
end
