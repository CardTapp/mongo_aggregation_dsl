# frozen_string_literal: true

module Aggregate
  # Represents an aggregation pipeline and is the main entry point to the DSL
  # Example: Aggregate::Pipeline.new().match().project().execute()
  class Pipeline
    attr_reader :stages

    def initialize(klass = nil)
      @klass = klass
      @stages = []
    end

    def to_s
      transpose
    end

    def inspect
      transpose.to_s
    end

    def transpose
      @stages.map(&:transpose)
    end

    # :reek:NilCheck
    def execute
      raise "Pipeline initializer must specify a class in order to be executable" if @klass.nil?

      @klass.collection.aggregate(transpose)
    end

    Aggregate::Stages.constants.each do |klass|
      define_method(klass.to_s.underscore) do |options|
        @stages << "Aggregate::Stages::#{klass}".constantize.new(options)
        self
      end
    end
  end
end
