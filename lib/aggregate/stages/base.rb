# frozen_string_literal: true

module Aggregate
  module Stages
    # derived stages are required to implement the following contract
    # def to_s
    # # return a properly formatted stage
    # end
    class Base < Aggregate::Values::Base
      include ::Contracts::Core
      include ::Contracts::Builtin
      attr_accessor :options
      def initialize(options)
        handler = self.class.value_handlers.detect { |h| h.handles?(options) }
        @options = handler.nil? ? options : handler.new(options, false)
      end
    end
  end
end
