# frozen_string_literal: true

module Aggregate
  module Stages
    # Base class for all stages that take a hash as an initializer option
    class HashBase < Base
      Contract C::HashMinLength[1] => Any
      def initialize(options)
        super(options)
      end
    end
  end
end
