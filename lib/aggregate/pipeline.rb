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
      inspect
    end

    def inspect
      @stages.to_s
    end

    # :reek:NilCheck
    def execute
      raise "Pipeline initializer must specify a class in order to be executable" if @klass.nil?

      db = Mongoid.default_client.database
      handler = Aggregate::Values::Pipeline.new(self)
      command = "function(){return db.#{@klass.collection_name}.aggregate(#{handler}).toArray()}"

      # https://github.com/mongodb/mongo-ruby-driver/blob/master/lib/mongo/operation/result.rb
      result = db.command("$eval": command, nolock: true, await_data: true)
      result.documents
    end

    Aggregate::Stages.constants.each do |klass|
      define_method(klass.to_s.underscore) do |options|
        @stages << "Aggregate::Stages::#{klass}".constantize.new(options)
        self
      end
    end
  end
end
