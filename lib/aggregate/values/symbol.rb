# frozen_string_literal: true

module Aggregate
  module Values
    # Returns a string wrapped in single quotes if the value or string if a key
    # Additionally adds $ to the reserved aggregation operations.
    class Symbol < Base
      # rubocop:disable Layout/AlignArray
      EXPRESSION_OPERATORS = %i[
        abs add ceil divide exp floor ln log log10 mod pow sqrt subtract trunc
        arrayElemAt arrayToObject concatArrays filter in indexOfArray isArray map objectToArray
          range reduce reverseArray size slice zip
        and not or
        cmp eq gt gte lt lte ne
        cond ifNull switch
        dateFromParts dateFromString dateToParts dateToString dayOfMonth dayOfWeek dayOfYear
          hour isoDayOfWeek isoWeek isoWeekYear millisecond minute month second toDate week year
        literal
        mergeObjects
        objectToArray
        allElementsTrue anyElementTrue setDifference setEquals setIntersection setIsSubset setUnion
        concat dateFromString dateToString indexOfBytes indexOfCP ltrim rtrim split strLenCP
          strcasecmp substr substrBytes substrCP toLower toString trim toUpper
        meta
        convert toBool toDate toDecimal toDouble toInt toLong toObjectId toString type
      ].freeze
      # rubocop:enable Layout/AlignArray

      GROUP_ACCUMULATORS = %i[avg first last max min push addToSet].freeze

      PROJECT_ACCUMULATORS = %i[avg max min push stdDevPop stdDevSamp sum].freeze
      def to_s
        inspect
      end

      def inspect
        is_operator = (%i[expr] + EXPRESSION_OPERATORS + GROUP_ACCUMULATORS + PROJECT_ACCUMULATORS).include?(value)
        retval = is_operator ? "$#{value}" : value

        retval = :_id if value == :id

        is_key ? retval.to_s : "'#{retval}'"
      end

      class << self
        def handles?(value)
          value.is_a? ::Symbol
        end
      end
    end
  end
end
