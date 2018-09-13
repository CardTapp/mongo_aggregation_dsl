# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Lookup do
  describe "#to_s" do
    it "should properly format" do
      expect(
        Aggregate::Stages::Lookup.new(
          from: Document,
          let: { test: :"$_id" },
          as: "test",
          pipeline: Aggregate::Pipeline.new
        ).to_s
      ).to eq "{ $lookup: { from: 'documents', let: { test: '$_id' }, as: 'test', pipeline: [] } }"
    end
  end
  describe "schema" do
    it "does not raise if hash is valid" do
      expect do
        Aggregate::Stages::Lookup.new(
          from: Document,
          let: { test: :test },
          as: "test",
          pipeline: Aggregate::Pipeline.new
        )
      end.not_to raise_error
    end

    describe "from" do
      it "raises if value is not a Class" do
        expect do
          Aggregate::Stages::Lookup.new(
            from: "",
            let: { test: :test },
            as: "test",
            pipeline: Aggregate::Pipeline.new
          )
        end.to raise_error(ParamContractError)
      end
      it "raises if value is not a Mongoid Document" do
        expect do
          Aggregate::Stages::Lookup.new(
            from: String,
            let: { test: :test },
            as: "test",
            pipeline: Aggregate::Pipeline.new
          )
        end.to raise_error(ParamContractError)
      end
    end

    describe "let" do
      it "raises if value is not a hash" do
        expect do
          Aggregate::Stages::Lookup.new(
            from: Document,
            let: "",
            as: "test",
            pipeline: Aggregate::Pipeline.new
          )
        end.to raise_error(ParamContractError)
      end
      it "raises if hash is empty" do
        expect do
          Aggregate::Stages::Lookup.new(
            from: Document,
            let: {},
            as: "test",
            pipeline: Aggregate::Pipeline.new
          )
        end.to raise_error(ParamContractError)
      end
      it "raises if hash values are not a symbol" do
        expect do
          Aggregate::Stages::Lookup.new(
            from: Document,
            let: { test: "" },
            as: "test",
            pipeline: Aggregate::Pipeline.new
          )
        end.to raise_error(ParamContractError)
      end
    end
    describe "as" do
      it "raises if value is not a string" do
        expect do
          Aggregate::Stages::Lookup.new(
            from: Document,
            let: { test: :test },
            as: 1,
            pipeline: Aggregate::Pipeline.new
          )
        end.to raise_error(ParamContractError)
      end
    end
    describe "pipeline" do
      it "raises if value is not a pipeline" do
        expect do
          Aggregate::Stages::Lookup.new(
            from: Document,
            let: { test: :test },
            as: "test",
            pipeline: ""
          )
        end.to raise_error(ParamContractError)
      end
    end
  end
end
