# frozen_string_literal: true

module Aggregate
  module Stages
    class Lookup < HashBase
      Contract KeywordArgs[
                       from: C::ClassIncludes[Mongoid::Document],
                       as: String,
                       let: And[HashOf[Symbol, Symbol], C::HashMinLength[1]],
                       pipeline: Aggregate::Pipeline] => Any
      def initialize(options)
        super(options)
      end

      def to_s
        inspect
      end

      def inspect
        "{ $lookup: #{options} }"
      end
    end
  end
end
