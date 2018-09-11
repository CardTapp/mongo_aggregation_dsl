# frozen_string_literal: true

module Aggregate
  module Stages
    class HashBase < Base
      Contract C::HashMinLength[1] => Any
      def initialize(options)
        super(Aggregate::Values::Hash.new(options, false))
      end
    end
  end
end
