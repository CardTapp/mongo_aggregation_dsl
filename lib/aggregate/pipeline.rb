# frozen_string_literal: true

module Aggregate
  # Represents an aggregation pipeline and is the main entry point to the DSL
  # Example: Aggregate::Pipeline.new().match().project().execute()
  class Pipeline
    attr_reader :stages, :primary_read

    def initialize(klass = nil)
      @primary_read = false
      @klass = klass
      @stages = []
      raise_message = "Pipeline initializer must specify a Mongoid::Document or collection name in order to be executable"
      raise raise_message if !klass.nil? && collection.nil?
    end

    def with_primary_read
      @primary_read = true
      return self
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
      if :primary_read
        collection.aggregate(transpose)
      else
        collection.aggregate(transpose, read: { mode: :secondary })
      end
    end

    Aggregate::Stages.constants.each do |klass|
      define_method(klass.to_s.underscore) do |options|
        @stages << "Aggregate::Stages::#{klass}".constantize.new(options)
        self
      end
    end

    private

    def collection
      if @klass.is_a?(String)
        @collection = Mongoid.default_client.collections.find{ |collection| collection.name == @klass }
      elsif @klass.is_a?(Class) && @klass.included_modules.include?(Mongoid::Document)
        @collection = @klass.collection
      end
      @collection
    end

  end
end
