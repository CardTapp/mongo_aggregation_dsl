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
      attr_reader :options
      # :reek:NilCheck
      def initialize(options)
        value_handler = self.class.value_handlers.detect { |handler| handler.handles?(options) }
        @options = value_handler.nil? ? options : value_handler.new(options, false)
      end
    end
  end
end
